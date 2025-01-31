import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_tvb/utils/nav.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> itemsGeral = [
      {'text': 'Como chegar?', 'icon': Icons.location_on},
      {'text': 'Giras da Semana', 'icon': Icons.access_time_outlined},
      {'text': 'Pontos do terreiro', 'icon': Icons.library_music},
      {'text': 'Eventos', 'icon': Icons.event},
    ];

    List<Map<String, dynamic>> itemsGiras = [
      {'text': 'Jardim de Aruanda', 'icon': Icons.bedroom_baby_outlined},
      {'text': 'Gira Cigana', 'icon': Icons.star_border_outlined},
      {'text': 'Gira de Cura', 'icon': Icons.heart_broken},
      {'text': 'Umbanda Pet', 'icon': Icons.pets},
    ];

    return Center(
      child: Column(
        children: [
          _buildCarousel(itemsGeral, context),
          _buildCarousel(itemsGiras, context),
        ],
      ),
    );
  }

  Widget _buildCarousel(List<Map<String, dynamic>> items, BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => _handleItemClick(context, item['text']),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['text'],
                      style: const TextStyle(fontSize: 32.0, color: Color(0xFF032156)),
                    ),
                    Icon(
                      item['icon'],
                      size: 86.0,
                      color: const Color(0xFF032156),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  void _handleItemClick(BuildContext context, String itemText) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF035653),
        content: Text('Você clicou em: $itemText'),
        duration: const Duration(seconds: 2),
      ),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(title: itemText),
        ),
      );
    });
  }
}

class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Detalhes sobre: $title',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
