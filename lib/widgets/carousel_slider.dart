import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {'text': 'Como chegar', 'icon': Icons.location_on, 'color': Color(0xFF032156)},
      {'text': 'Giras da Semana', 'icon': Icons.access_time_outlined, 'color': Color(0xFF032156)},
      {'text': 'Pontos cantados', 'icon': Icons.library_music, 'color': Color(0xFF032156)},
      {'text': 'Eventos', 'icon': Icons.event, 'color': Color(0xFF032156)},
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16/9,
        viewportFraction: 0.8,
        initialPage: 0,
      ),
      items: items.map((item) {
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
                    style: TextStyle(fontSize: 32.0, color: Colors.white),
                  ),
                  Icon(
                    item['icon'],
                    size: 86.0,
                    color: Colors.white,
                  )
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
