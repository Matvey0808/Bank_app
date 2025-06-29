import 'package:bank_app/cards/cardBank.dart';
import 'package:bank_app/screens/home_screen.dart';
import 'package:bank_app/screens/profile_screen.dart';
import 'package:bank_app/screens/onboarding_screen.dart';
import 'package:bank_app/screens/signin_screen.dart';
import 'package:bank_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
