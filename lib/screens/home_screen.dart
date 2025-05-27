import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 24, 34),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SvgPicture.asset(
              "assets/images/LogoBank.svg",
              width: 140,
              height: 140,
            ),
          ),
        ),
      ),
    );
  }
}

// Экранчик обучения 1
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 24, 34),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 110),
                child: SvgPicture.asset(
                  "assets/images/Group1.svg",
                  width: 260,
                  height: 260,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
