import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/auth/cubit/auth_cubit.dart';
import 'package:food_app/features/auth/login/screen/login_screen.dart';
import 'package:food_app/features/auth/signup/screen/signup_screen.dart';
import 'package:food_app/features/get_started/get_started_screen.dart';
import 'package:food_app/features/home/screen/home_screen.dart';
import 'package:food_app/features/splash/splash_screen.dart';
import 'package:food_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/getStarted': (context) => GetStartedScreen(),
        '/login': (context) => BlocProvider(
          create: (BuildContext context) => AuthCubit(),
          child: LoginScreen(),
        ),
        '/signUp': (context) => BlocProvider(
          create: (BuildContext context) => AuthCubit(),
          child: SignupScreen(),
        ),
        '/home': (context) => HomeScreen(),
      },
      home: Scaffold(body: SplashScreens()),
    );
  }
}
