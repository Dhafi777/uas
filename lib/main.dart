import 'package:flutter/material.dart';
import 'UserListPage.dart'; // Assuming your UserListPage is in user_list_page.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Daftar Pengguna', // Changed title
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const UserListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
