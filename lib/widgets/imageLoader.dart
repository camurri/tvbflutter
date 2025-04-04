import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageLoader extends StatelessWidget {
  final double logoSize;
  final String path;
  final ColorFilter? colorFilter;

  const ImageLoader({
    super.key,
    required this.logoSize,
    required this.path,
    this.colorFilter,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      height: logoSize,
      width: logoSize,
      colorFilter: colorFilter, // <-- Aplicando a cor aqui
      placeholderBuilder: (context) => const CircularProgressIndicator(),
    );
  }
}
