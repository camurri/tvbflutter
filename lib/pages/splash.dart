import 'package:flutter/material.dart';
import 'home.dart'; // Certifique-se de que o arquivo home.dart existe

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _visible = true; // Controla a visibilidade da tela de Splash

  @override
  void initState() {
    super.initState();

    // Simula uma espera de 3 segundos antes de mudar para a tela principal
    Future.delayed(const Duration(seconds: 3), () {
      // Faz a tela de Splash desaparecer gradualmente
      setState(() {
        _visible = false;
      });

      // Navega para a Home Screen após o fade out
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const Home(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0, // Controla a opacidade da tela de Splash
        duration: const Duration(milliseconds: 500), // Duração do fade
        child: Center(
          child: Image.asset(
            'assets/images/logo.png', // Exibe a imagem diretamente
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error); // Fallback em caso de erro
            },
          ),
        ),
      ),
    );
  }
}