import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00001A),
      body: Center(
        child: Container(
          width: 300,
          height: 400,
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
              SizedBox(height: 10,),
              Text('Login', textAlign: .center, style: TextStyle(
                 color: Colors.white,
                 fontSize: 22,
                 fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10,),
              TextField(
                
                decoration: InputDecoration(
                  labelText: 'Email',labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter email',hintStyle: TextStyle(
                    color: Colors.grey, fontSize: 12),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.white,),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Color(0xFF000047),
                    width: 3,
                  )),
                  )
                ),

                SizedBox(height: 10,),

                 TextField(
                
                decoration: InputDecoration(
                  labelText: 'Password',labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Enter Password',hintStyle: TextStyle(
                    color: Colors.grey, fontSize: 12),
                  prefixIcon: Icon(Icons.lock_outlined, color: Colors.white,),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color: Color(0xFF000047),
                    width: 3,
                  )),
                  )
                ),
                SizedBox(height: 10,),
                SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed: ()=> context.push('/userprofilescreen'), child: Text('Login'),),
                )
              
            ],
          ),
        ),
      ),
    );
  }
}