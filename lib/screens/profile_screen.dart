import 'package:flutter/material.dart';
import 'package:navigation_flutter/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final name = ModalRoute.of(context)!.settings.arguments as String;
    final userProvider = context.watch<UserProvider>();
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(105),
                blurRadius: 15,
                offset: Offset(4, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 70,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 139, 5, 206),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          userProvider.email,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Flutter Dev',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              const Divider(),
              const SizedBox(height: 20),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  const Chip(label: Text('Flutter')),
                  const Chip(label: Text('Dart')),
                  const Chip(label: Text('Android')),
                  const Chip(label: Text('Ui design')),
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  child: Text('go to home screen'),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  },
                  child: Text('Log out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
