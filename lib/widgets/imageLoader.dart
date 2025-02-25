import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageLoader extends StatelessWidget {
  
  final String path;
  final double logoSize;
  const ImageLoader({super.key, required this.logoSize, required this.path});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      // Imagem SVG com base no tema
      Theme.of(context).brightness == Brightness.light
          ? path  // Versão clara
          : path,  // Versão escura
      width: logoSize, //largura do logo no topo da tela
      height: logoSize,// altura do logo no topo da tela
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.primary, // Cor do tema
        BlendMode.srcIn,
      ),
    );
  }
}
