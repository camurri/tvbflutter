import 'package:flutter/material.dart';
import 'package:app_tvb/widgets/carousel_slider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém o tamanho da tela
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFF032156), // Mantido conforme solicitado
        title: const Text('TVB Digital'), // Mantido conforme solicitado
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, // 5% da largura da tela
              vertical: screenHeight * 0.02, // 2% da altura da tela
            ),
            child: Column(
              children: [
                // Logo com tamanho proporcional à largura da tela
                Image.asset(
                  'assets/images/logo.png',
                  width: screenWidth * 0.3, // 80% da largura da tela
                  fit: BoxFit.contain, // Mantém a proporção da imagem
                ),
                SizedBox(height: screenHeight * 0.05), // 5% da altura da tela
                // Carrossel
                CarouselWidget(),
                SizedBox(height: screenHeight * 0.05), // 5% da altura da tela
              ],
            ),
          ),
        ),
      ),
    );
  }
}