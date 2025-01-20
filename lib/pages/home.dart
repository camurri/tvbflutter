import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'), // Título da barra de navegação
      ),
      body: const Center(
        child: Text(
          'Bem-vindo ao TVB!',
          style: TextStyle(fontSize: 24), // Estilo do texto
        ),
      ),
    );
  }
}
