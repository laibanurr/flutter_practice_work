import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PgeA extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  PgeA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(controller: _nameController),
            SizedBox(height: 10),
            TextField(
              controller: _ageController,

            ),
            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () {
                context.go('/user/${_nameController.text}/${_ageController.text}');
              },
              child: Text('Go'),
            ),
          ],
        ),
      ),
    );
  }
}
