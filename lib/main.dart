import 'package:flutter/material.dart';
import 'package:navigation_flutter/noteapp/routes_notesscreens.dart';
import 'package:navigation_flutter/routes/app_router.dart';
import 'package:navigation_flutter/screens/home_screen.dart';
import 'package:navigation_flutter/screens/log_in_screen.dart';
import 'package:navigation_flutter/screens/profile_screen.dart';
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
    return MaterialApp.router(routerConfig: notesAppRouters,
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

