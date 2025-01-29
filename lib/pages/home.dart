import 'package:flutter/material.dart';
import 'package:app_tvb/widgets/carousel_slider.dart';



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TVB Digital'), // Título da barra de navegação
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            CarouselWidget()


      ],
        ),
      ),
    );
  }
}
