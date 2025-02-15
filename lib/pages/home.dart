import 'package:flutter/material.dart';
import 'package:app_tvb/widgets/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20), //Posição do texto da AppBar em relação ao topo
            const Text(
              'TVB Digital',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
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
                      child: SvgPicture.asset(
                        // Imagem SVG com base no tema
                        Theme.of(context).brightness == Brightness.light
                            ? 'assets/images/svg/logo.svg'  // Versão clara
                            : 'assets/images/svg/logo.svg',  // Versão escura
                        width: 150, //largura do logo no topo da tela
                        height: 150,// altura do logo no topo da tela
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary, // Cor do tema
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 800,
                        minWidth: 300,
                      ),
                      child: CarouselWidget(),  // Certifique-se que seu widget de carousel está bem dimensionado
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
