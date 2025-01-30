import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items_geral = [
      {
        'text': 'Como chegar?',
        'icon': Icons.location_on,
        'color': Colors.white
      },
      {
        'text': 'Giras da Semana',
        'icon': Icons.access_time_outlined,
        'color': Colors.white
      },
      {
        'text': 'Pontos do terreiro',
        'icon': Icons.library_music,
        'color': Colors.white
      },
      {'text': 'Eventos', 'icon': Icons.event, 'color': Colors.white},
    ];

    List<Map<String, dynamic>> items_giras= [
      {
        'text': 'Jardim de Aruanda',
        'icon': Icons.bedroom_baby_outlined,
        'color': Colors.white
      },
      {
        'text': 'Gira Cigana',
        'icon': Icons.star_border_outlined,
        'color': Colors.white
      },
      {
        'text': 'Gira de Cura',
        'icon': Icons.heart_broken,
        'color': Colors.white
      },
      {'text': 'Umbanda Pet', 'icon': Icons.pets, 'color': Colors.white},
    ];

    return Center(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
            ),
            items: items_geral.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: item['color'],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item['text'],
                          style: TextStyle(
                              fontSize: 32.0, color: Color(0xFF032156)),
                        ),
                        Icon(
                          item['icon'],
                          size: 86.0,
                          color: Color(0xFF032156),
                        )
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
            ),
            items: items_giras.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: item['color'],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item['text'],
                          style: TextStyle(
                              fontSize: 32.0, color: Color(0xFF032156)),
                        ),
                        Icon(
                          item['icon'],
                          size: 86.0,
                          color: Color(0xFF032156),
                        )
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
