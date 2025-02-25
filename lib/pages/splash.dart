import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_notifier.dart';
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
    final isDarkMode = Provider.of<ThemeNotifier>(context).themeMode == ThemeMode.dark;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                isDarkMode
                    ? 'assets/images/png/bkg.png'  // Imagem para o tema escuro
                    : 'assets/images/png/bkg.png', // Imagem para o tema claro
                width: 400,
                height: 400,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
