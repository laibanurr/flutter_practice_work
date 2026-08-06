import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00001A),
      
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: const Color(0xFF000047),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blueGrey,
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Emily ',
                textAlign: .center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF00001A),
                  border: Border.all(strokeAlign: BorderSide.strokeAlignOutside))
                  ,child: Text(
                          'emilu@gmail.com',style: TextStyle(color: Colors.white),
                  ),),

                   SizedBox(height: 10),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF00001A),
                  border: Border.all(strokeAlign: BorderSide.strokeAlignOutside))
                  ,child: Text(
                          'em123455',style: TextStyle(color: Colors.white),
                  ),),
              
            ],
          ),
        ),
      ),
    );
  }
}
