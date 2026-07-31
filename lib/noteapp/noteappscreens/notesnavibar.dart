import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotesNaviBar extends StatelessWidget {
  final StatefulNavigationShell naviShell;
  
  const NotesNaviBar({super.key , required this.naviShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Notes App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: naviShell,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
      ],
      onTap: (index) {
        naviShell.goBranch(index);
      },),
    
    );
  }
}
