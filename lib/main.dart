

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:navigation_flutter/auth/models/routes/go_routers.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await authService.loadToken();
  // runApp(
  //   ChangeNotifierProvider(create: (_) => UserProvider(), child: const MyApp()),
  // );
  // runApp(const MyApp());
//}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: authRouterApi,

      //return MaterialApp(
      //  home: PopupMenuWithBottomShhet(),
     // debugShowCheckedModeBanner: false,
      // initialRoute: '/login',
      // routes: {
      //   '/login': (context) => const LoginScreen(),
      //   '/home': (context) => const HomeScreen(),
      //   '/profile': (context) => const ProfileScreen(),
      // },
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:navigation_flutter/auth/models/routes/go_routers.dart';
import 'package:navigation_flutter/provider/user_provider.dart';
import 'package:navigation_flutter/provider_practice/cart/cart_model.dart';
import 'package:navigation_flutter/provider_practice/cart/products_list.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart'; // Uncomment if using Provider
// import 'package:navigation_flutter/auth/models/routes/go_routers.dart'; // Uncomment for GoRouter

// ===================================================================
// CONFIGURATION 1: Basic App with a Single Home Widget
// ===================================================================
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PopupMenuWithBottomShhet(), // Make sure this widget exists
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
*/

// ===================================================================
// CONFIGURATION 2: Named Routes Navigation
// ===================================================================
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
*/

// ===================================================================
// CONFIGURATION 3: GoRouter Navigation Setup
// ===================================================================
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: authRouterApi, // Defined in your go_routers.dart
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
*/

// ===================================================================
// CONFIGURATION 4: Provider Setup (CartModel or UserProvider)
// ===================================================================
/*
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(), // Or UserProvider()
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // Change to your cart/home screen widget
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
*/

// ===================================================================
// CONFIGURATION 5: Async Initialization (e.g., Load Token & Auth Provider)
// ===================================================================

// void main() async {
//    WidgetsFlutterBinding.ensureInitialized();
//   await authService.loadToken(); // Uncomment if authService is initialized
  
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => UserProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: authRouterApi,
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=>CartModel(),
    
    child : MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:ProductListScreen()
    );
  }
}
