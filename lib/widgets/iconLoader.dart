import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconLoader extends StatelessWidget {

  String path;
  IconLoader({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      // Imagem SVG com base no tema
      Theme.of(context).brightness == Brightness.light
          ? path  // Versão clara
          : path,  // Versão escura
      width: 50, //largura do logo no topo da tela
      height: 50,// altura do logo no topo da tela
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.primary, // Cor do tema
        BlendMode.srcIn,
      ),
    );
  }
}
