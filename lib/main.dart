import 'package:flutter/material.dart';
import 'pages/splash.dart'; // Importa o arquivo de splash screen
import 'pages/home.dart'; // Importa o arquivo de home


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Para ocultar a faixa de depuração
      home: Splash(),
    );
  }
}



