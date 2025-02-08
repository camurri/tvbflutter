import 'package:flutter/material.dart';
import 'package:app_tvb/widgets/carousel_slider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFF032156),
        title: Column(
          mainAxisSize: MainAxisSize.min, // Evita ocupar espaço extra
          children: [
            SizedBox(height: 6), // Ajuste a altura conforme necessário
            const Text(
              'TVB Digital',
              style: TextStyle(fontSize: 20), // Ajuste o tamanho se necessário
            ),
          ],
        ),
        centerTitle: true, // Mantém centralizado
      ),

      body: LayoutBuilder( // Adicionado para melhor controle responsivo
        builder: (context, constraints) {
          double logoSize = constraints.maxWidth * 0.3;
          if (constraints.maxWidth < 600) logoSize = constraints.maxWidth * 0.5; // Aumenta em telas pequenas
          if (constraints.maxWidth > 1200) logoSize = constraints.maxWidth * 0.2; // Reduz em telas grandes

          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    Hero(
                      tag: 'logo',
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: logoSize,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    // Carrossel responsivo
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 800, // Define um limite para telas grandes
                        minWidth: 300, // Mantém um tamanho mínimo
                      ),
                      child: CarouselWidget(),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
