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
    // Atraso de 3 segundos para navegação
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
              child: SvgPicture.asset(
                'assets/images/svg/logo.svg',
                width: screenWidth * 0.6,  // Ajusta o tamanho com base na largura da tela
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor,  // Cor baseada no tema
                  BlendMode.srcIn,  // Aplica a cor ao SVG
                ),
              ),
            );
          },
          child: SvgPicture.asset(
            'assets/images/bkg.svg',
            width: 200,  // Tamanho fixo para o logo
            height: 200,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,  // Pega a cor do tema
              BlendMode.srcIn,  // Aplica a cor ao SVG
            ),
          ),
        ),
      ),
    );
  }
}
