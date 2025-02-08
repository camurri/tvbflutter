import 'package:flutter/material.dart';
import 'package:app_tvb/widgets/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart'; // Certifique-se de importar o ThemeNotifier

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFFFFFFFF),
        title: Column(
          mainAxisSize: MainAxisSize.min, // Evita ocupar espaço extra
          children: [
            SizedBox(height: 7), // Ajuste a altura conforme necessário
            const Text(
              'TVB Digital',
              style: TextStyle(fontSize: 20), // Ajuste o tamanho se necessário
            ),
          ],
        ),
        centerTitle: true, // Mantém centralizado
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              // Alternar entre tema claro e escuro
              final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
              themeNotifier.toggleTheme();
            },
          ),
        ],
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          double logoSize = constraints.maxWidth * 0.3;
          if (constraints.maxWidth < 600) logoSize = constraints.maxWidth * 0.5;
          if (constraints.maxWidth > 1200) logoSize = constraints.maxWidth * 0.2;

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
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 800,
                        minWidth: 300,
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
