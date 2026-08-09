

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation_flutter/auth/models/routes/go_routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await authService.loadToken();
  // runApp(
  //   ChangeNotifierProvider(create: (_) => UserProvider(), child: const MyApp()),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: authRouterApi,

      //return MaterialApp(
      //  home: PopupMenuWithBottomShhet(),
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
