import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Appshellroute extends StatelessWidget {
  final StatefulNavigationShell navishell;
  const Appshellroute({super.key, required this.navishell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Shell Practice')),
      body: navishell,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          navishell.goBranch(index);
        },
      ),
    );
  }
}
