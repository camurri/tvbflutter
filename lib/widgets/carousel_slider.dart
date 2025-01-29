import 'package:carousel_slider/carousel_slider.dart';

// lib/carousel_widget.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16/9,
        viewportFraction: 0.8,
        initialPage: 0,
      ),
      items: [1, 2, 3,].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Color(0xFF032156),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text('Item $i', style: TextStyle(fontSize: 16.0)),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}