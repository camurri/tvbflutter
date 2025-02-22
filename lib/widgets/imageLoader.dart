import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class imageLoader extends StatelessWidget {
  
  final path = 'assets/images/svg/bkg.svg';
  const imageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      // Imagem SVG com base no tema
      Theme.of(context).brightness == Brightness.light
          ? path  // Versão clara
          : path,  // Versão escura
      width: 200, //largura do logo no topo da tela
      height: 200,// altura do logo no topo da tela
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.primary, // Cor do tema
        BlendMode.srcIn,
      ),
    );
  }
}
