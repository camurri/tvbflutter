import 'package:flutter/material.dart';
import 'package:app_tvb/widgets/imageLoader.dart';
import 'package:app_tvb/widgets/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../theme/theme_notifier.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFF78F436),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 7),
            const Text('TVB Digital', style: TextStyle(fontSize: 20)),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4_outlined),
            onPressed: () {
              final themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
              themeNotifier.toggleTheme();
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double logoSize = constraints.maxWidth * 0.2;
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
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Hero(
                        tag: 'logo',
                        child: ImageLoader(logoSize: logoSize, path: 'assets/images/svg/logo.svg'),
                      ),
                    ),

                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 800, minWidth: 300),
                      child:  CarouselWidget(),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                   // const MediunDivider(),
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
