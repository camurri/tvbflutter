import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'carouselScreen.dart';

class CarouselWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final Duration delay;
  final bool reverse;
  const CarouselWidget({super.key, required this.items, required this.delay, required this.reverse});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(delay),
      builder: (context, snapshot) {
        return AnimatedOpacity(
          opacity: snapshot.connectionState == ConnectionState.done ? 1.0 : 0.0,
          duration: const Duration(seconds: 1),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 250.0,
              reverse: reverse,
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
            ),
            items: items.map((item) => CarouselItem(item: item)).toList(),
          ),
        );
      },
    );
  }
}