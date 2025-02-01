import 'package:flutter/material.dart';
import 'package:app_tvb/widgets/carousel_slider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFF032156),
        title: const Text('TVB Digital'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/logo.png', height: 250),
            CarouselWidget(),
            //SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
