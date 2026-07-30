import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  final String username;
  final String age;
  const UserPage({super.key, required this.username , required this.age});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(children: [Text('hello , ${widget.username} '
    ),
    SizedBox(height: 10,),
    Text('congrats on turning ${widget.age}')]),
     ) );
  }
}
