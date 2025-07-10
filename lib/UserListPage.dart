import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'about_devloper.dart'; // Ensure this matches your file name
import 'user_detail_page.dart'; // Ensure this matches your file name
import 'liga.dart'; // Your Liga model

// WIDGET: UserListPage
class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<Liga> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
  final url = Uri.parse('https://reqres.in/api/users?page=1');
  print('Attempting to fetch from URL: $url');
  try {
    final response = await http.get(
  url,
  headers: {
    'x-api-key': 'reqres-free-v1',
    'Content-Type': 'application/json',
  },
);


    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        users = (data['data'] as List)
            .map((userData) => Liga.fromJson(userData))
            .toList();
        isLoading = false;
      });
    } else {
      print("Failed to load users. HTTP Status: ${response.statusCode}");
      setState(() => isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Gagal memuat data pengguna. Status: ${response.statusCode}',
            ),
          ),
        );
      }
    }
  } catch (e) {
    print("Error fetching users: $e");
    setState(() => isLoading = false);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan jaringan: $e')),
      );
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pengguna'),
      ), // Changed title to Pengguna
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : users
                  .isEmpty // Check if users list is empty after loading
              ? const Center(child: Text('Tidak ada data pengguna ditemukan.'))
              : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    title: Text("${user.firstName} ${user.lastName}"),
                    subtitle: Text("ID: ${user.id}"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailPage(user: user),
                        ),
                      );
                    },
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutDeveloper()),
          );
        },
        child: const Icon(
          Icons.info_outline,
        ), // Changed icon to info_outline for "About"
        tooltip: 'Tentang Pengembang', // Changed tooltip
      ),
    );
  }
}
