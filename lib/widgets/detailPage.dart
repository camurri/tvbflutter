import 'package:app_tvb/widgets/sheetText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bigLocation.dart';
import 'cardWidget.dart';
import 'mediunDivider.dart';

class DetailPage extends StatelessWidget {
  final String title; // O título do item do carrossel
  final String textContent; // O texto dos cards
  final String imagePath; // a imagem dos cards

  const DetailPage(
      {super.key,
        required this.title,
        required this.textContent,
        required this.imagePath});

  //DetailPage sendo construída e implementando a organização dos Widgets
  @override
  Widget build(BuildContext context) {
    //Disposição dos componentes começa daqui
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  //Responsável por arredondar as bordas da imagem
                  borderRadius: BorderRadius.circular(20.0),
                  child:
                  imagePath.endsWith('.svg') // Verifica se a imagem é SVG
                      ? SvgPicture.asset(
                    imagePath, // Imagem SVG que será carregada
                    height: 200,
                    fit: BoxFit.cover,

                    colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn),
                    errorBuilder: (context, error, stackTrace) {
                      //Tratamento de erro do ícone
                      return const Icon(Icons.error);
                    },
                  )
                      : Image.asset(
                    imagePath, // Imagem PNG que será carregada
                    height: 400,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),

                if (title == 'Orações') // Verifica se a lógica do mapa pode ou não ser carregada
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(color: Color(0xFF032156), borderRadius: BorderRadius.circular(16.0),),
                    child: Column(
                      children: [
                        Text("Acessar orações", style: TextStyle(fontSize: 22, color: Colors.white),),// Texto de orações
                        IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Cardwidget()),
                            );
                          },

                          iconSize: 50,
                          icon: const Icon(Icons.play_arrow), // Ícone de play
                        ),
                      ],
                    ),
                  ),

                //const SizedBox(height: 15),

                const MediunDivider(),

                // Espaço entre Imagem e texto de exibição

                MySheetText(textContent: textContent),
                // Widget de Texto (sheetText.dart)

                //Verifica se a lógica do mapa pode ou não ser carregada
                if (title == 'Como chegar?')
                  BigLocation(
                    pressed: () => print('Abrindo mapa...'),
                  ),
                //Widget Ícone Grande
              ],
            ),
          ),
        ),
      ),
    );
  }
}