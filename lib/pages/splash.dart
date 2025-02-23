import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'logo',
          child: SvgPicture.asset(
            'assets/images/svg/bkg.svg',
            width: 400,
            height: 400,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
