import 'package:flutter/material.dart';

// Sample data structure to simulate your AuthData
class SampleUserData {
  final int id;
  final String username;
  final String email;
  final String role;
  final String token;

  SampleUserData({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    required this.token,
  });
}

class PopupMenuWithBottomShhet extends StatelessWidget {
  const PopupMenuWithBottomShhet({super.key});

  // 1. Pass live user data into the helper method
  void _showProfileDetails(BuildContext context, SampleUserData user) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            // FIXED SYNTAX: Enums must have their type names explicitly declared
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'User Details',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              // 2. Display dynamic data fields
              Text('User ID: ${user.id}'),
              const SizedBox(height: 4),
              Text('Username: ${user.username}'),
              const SizedBox(height: 4),
              Text('Email: ${user.email}'),
              const SizedBox(height: 4),
              Text('Role: ${user.role}'),
              const SizedBox(height: 4),
              SelectableText('Token: ${user.token}'), // Allows user to copy token
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Dummy user instance for testing
    final currentUser = SampleUserData(
      id: 1,
      username: 'user_123',
      email: 'user@example.com',
      role: 'Developer',
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pop Up menu demo'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              switch (value) {
                case 'profile':
                  // Pass currentUser to the bottom sheet helper
                  _showProfileDetails(context, currentUser);
                  break;
                case 'settings':
                  print('SETTINGSSSS');
                  break;
                case 'Logout':
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('LOG TF OUTTTTTTTTT')),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(Icons.person, color: Colors.deepPurple),
                    SizedBox(width: 8),
                    Text('View Profile'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings, color: Colors.deepPurple),
                    SizedBox(width: 8),
                    Text('View Settings'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'Logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 8),
                    Text('LOGOUT', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: const Center(child: Text('Tap three dots in appbar')),
    );
  }
}