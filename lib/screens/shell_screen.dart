import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellWidget extends StatelessWidget {
  final Widget child;
  const ShellWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Bar')),

      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_off_outlined),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            context.go('/counterDisplay');
          }
          if (index == 1) {
            context.go('/b');
          }
        },
      ),
    );
  }
}
