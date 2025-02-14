import 'package:flutter/material.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1200),
          pageBuilder: (context, animation, secondaryAnimation) => const Home(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          flightShuttleBuilder: (context, animation, direction, fromContext, toContext) {
            return ScaleTransition(
              scale: animation.drive(
                Tween(begin: 1.2, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: Image.asset('assets/images/bkg.png', width: screenWidth * 0.6),
            );
          },
          child: Image.asset('assets/images/bkg.png', width: screenWidth * 0.6),
        ),
      ),
    );
  }
}
