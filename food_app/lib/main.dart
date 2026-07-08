import 'package:flutter/material.dart';
import 'package:food_app/features/auth/login/screen/login_screen.dart';
import 'package:food_app/features/auth/signup/screen/signup_screen.dart';
import 'package:food_app/features/get_started/get_started_screen.dart';
import 'package:food_app/features/home/screen/home_screen.dart';
import 'package:food_app/features/splash/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/getStarted': (context) => GetStartedScreen(),
        '/login': (context) => LoginScreen(),
        '/signUp': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
      },
      home: Scaffold(body: SplashScreens()),
    );
  }
} 

