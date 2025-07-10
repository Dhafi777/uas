import 'package:flutter/material.dart';
import 'liga.dart'; // Assuming Liga is your user model

class UserDetailPage extends StatelessWidget {
  final Liga user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${user.firstName} ${user.lastName}')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(user.avatar),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Nama: ${user.firstName} ${user.lastName}', // Changed "Name" to "Nama"
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Email: ${user.email}',
                style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
              ),
              const SizedBox(height: 10.0),
              Text(
                'ID: ${user.id}',
                style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
