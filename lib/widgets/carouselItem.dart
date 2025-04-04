// lib/screens/carouselScreen.dart
import 'package:flutter/material.dart';
import 'package:app_tvb/widgets/carouselWidget.dart';
import 'package:app_tvb/widgets/mediunDivider.dart';
import 'package:app_tvb/widgets/carouselData.dart';


class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CarouselWidget(items: itemsGeral, delay: const Duration(seconds: 1), reverse: true,),
          MediunDivider(),
          CarouselWidget(items: itemsGiras, delay: const Duration(seconds: 1), reverse: false,),
        ],
      ),
    );
  }
}
