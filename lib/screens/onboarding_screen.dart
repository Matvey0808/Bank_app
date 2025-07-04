import 'package:bank_app/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _initializeAndNavigate();
  }

  Future<void> _initializeAndNavigate() async {
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 24, 34),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SvgPicture.asset(
                  "assets/images/LogoBank.svg",
                  width: 140,
                  height: 140,
                ),
              ),
            ),
            SizedBox(height: 10),
            const SpinKitFadingCircle(color: Colors.white, size: 35),
          ],
        ),
      ),
    );
  }
}

// Онбординг
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int nextPageIndex = _pageController.page!.round();
      if (nextPageIndex != _currentPageIndex) {
        setState(() {
          _currentPageIndex = nextPageIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPageIndicator(int index) {
    bool isActive = index == _currentPageIndex;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 7,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey[400],
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 24, 34),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  children: <Widget>[
                    _buildPage(
                      "assets/images/Group1.svg",
                      "Fastest Payment in\nthe world",
                      "Integrate multiple payment methoods\nto help you up the process quickly",
                    ),
                    _buildPage(
                      "assets/images/Group 3.svg",
                      "The most Secoure\nPlatfrom for Customer",
                      "Built-in Fingerprint, face\nrecognition and more, keeping you\ncompletely safe",
                    ),
                    _buildPage(
                      "assets/images/Group 4.svg",
                      "Paying for Everything is\nEasy and Convenient",
                      "Built-in Fingerprint, face recognition\nand more, keeping you completely safe",
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 320),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _numPages,
                        (index) => _buildPageIndicator(index),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SizedBox(
              width: 370,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: Color.fromARGB(255, 7, 105, 235),
                ),
                onPressed: () {
                  if (_currentPageIndex < _numPages - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) =>
                                SigninScreen(),
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) {
                          var begin = const Offset(2.0, 0.0);
                          var end = Offset.zero;
                          var curve = Curves.easeOut;

                          var tween = Tween(
                            begin: begin,
                            end: end,
                          ).chain(CurveTween(curve: curve));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  }
                },
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildPage(String imagePath, String title, String description) {
  return Container(
    color: const Color.fromARGB(255, 22, 24, 34),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 230),
          child: SvgPicture.asset(imagePath, height: 270, fit: BoxFit.contain),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 17, color: Colors.white70),
          ),
        ),
      ],
    ),
  );
}
