import 'package:flutter/material.dart';
import 'package:navigation_flutter/api_practice/screens/post_screen.dart';
import 'package:navigation_flutter/auth/models/routes/go_routers.dart';
import 'package:navigation_flutter/auth/screens/login_screen.dart';
import 'package:navigation_flutter/dio_api_practice/models/routes/go_routers.dart';
import 'package:navigation_flutter/dio_api_practice/screens/user_screen.dart';
import 'package:navigation_flutter/dio_api_practice/screens/user_screen_interceptors.dart';
import 'package:navigation_flutter/textformfield/contact_form.dart';
import 'package:provider/provider.dart';
import 'provider/user_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => UserProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
     return MaterialApp.router(routerConfig:authRouterApi ,
    //  return MaterialApp(
    //    home: LoginScreen(),
    
       debugShowCheckedModeBanner: false,
      // initialRoute: '/login',
      // routes: {
      //   '/login': (context) => const LoginScreen(),
      //   '/home': (context) => const HomeScreen(),
      //   '/profile': (context) => const ProfileScreen(),
      // },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

