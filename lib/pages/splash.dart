// Splash contendo logo de apresentação
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
    // Simula uma espera de 3 segundos antes de mudar para a tela principal
    Future.delayed(const Duration(seconds: 3), () {
      // Navega para a Home Screen após o Splash
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.png'), // Exibe a imagem diretamente
      ),
    );
  }
}

