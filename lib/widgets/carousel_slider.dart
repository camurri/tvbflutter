import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart' as path;

import 'package:app_tvb/widgets/bigLocation.dart';
import 'package:app_tvb/widgets/sheetText.dart';
import 'package:app_tvb/texts/texts.dart';
import 'package:app_tvb/widgets/mediunDivider.dart';

////////////////////////////////////////////////////////////
class CarouselWidget extends StatelessWidget {
  CarouselWidget({super.key});

  //Aqui é contruida a estrutura contendo dois carrosseis dentro de
  //Uma coluna
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // Coluna de organização dos carrosseis
        children: [
          //Carrossel superior
          DelayedCarousel(
            items: _itemsGeral,
            delay: const Duration(milliseconds: 500),
          ),

          MediunDivider(),

          //Carrossel superior
          DelayedCarousel(
            items: _itemsGiras,
            delay: const Duration(milliseconds: 500),
          ),

          //Implementar mais carrosseis ou outros componente aqui se necessário
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> _itensGiraDaSemana = [
    {'paths': 'assets/images/svg/fumo.svg'},
    {'paths': 'assets/images/svg/ancora.svg'},
    {'paths': 'assets/images/svg/arco.svg'},
    {'paths': 'assets/images/svg/coco.svg'},
    {'paths': 'assets/images/svg/tridente.svg'},
  ];

  String weekEvent_path = 'assets/images/svg/coco.svg';

  //////////////////////////////////////////////////////////////////////
  //Aqui trata-se apenas das imagens dos items do carrossel em formato .svg
  late List<Map<String, dynamic>> _itemsGeral = [
    //{'text': 'Essa Semana', 'icon': _itensGiraDaSemana[0]['paths']},
    {'text': 'Giras da Semana', 'icon': 'assets/images/svg/schedule.svg'},
    {'text': 'Como chegar?', 'icon': 'assets/images/svg/road.svg'},
    {
      'text': 'Pontos do Terreiro',
      'icon': 'assets/images/svg/african-drum.svg'
    },
    {'text': 'Orações', 'icon': 'assets/images/svg/pray.svg'},
    {'text': 'Nossa História', 'icon': 'assets/images/svg/logo.svg'},
    {'text': 'Redes Sociais', 'icon': 'assets/images/svg/social-media.svg'},
  ];

  //Aqui trata-se apenas das imagens dos items do carrossel em formato .png
  final List<Map<String, dynamic>> _itemsGiras = [
    {'text': 'Jardim de Aruanda', 'icon': 'assets/images/svg/reading.svg'},
    {'text': 'Gira Cigana', 'icon': 'assets/images/svg/fire.svg'},
    {'text': 'Gira de Cura', 'icon': 'assets/images/svg/pray.svg'},
    {'text': 'Umbanda Pet', 'icon': 'assets/images/svg/dog.svg'},
    {'text': 'Sagrado Feminino', 'icon': 'assets/images/svg/flower.svg'},
    {'text': 'Gira das Bruxas', 'icon': 'assets/images/svg/spell-book.svg'},
    {'text': 'Medicinas', 'icon': 'assets/images/svg/cherokee.svg'},
    {'text': 'TVB Verde', 'icon': 'assets/images/svg/green.svg'},
  ];
}

/////////////////////////////////////////////////////////////////////////////
class CarouselItem extends StatefulWidget {
  final Map<String, dynamic> item;

  const CarouselItem({super.key, required this.item});

  @override
  State<CarouselItem> createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  int indiceMensagem = 0;

  final List<String> mensagens = [
    'A Umbanda é paz e amor.',
    'Respeite todas as religiões.',
    'Acredite no poder da fé.',
    'A espiritualidade nos conecta.',
    'A Umbanda acolhe a todos.',
    'Avante, filhos de fé.'
  ];

  //Aqui o tema é decidido entre claro e escuro
  @override
  Widget build(BuildContext context) {
    //Cor do texto adaptável ao tema
    Color textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    //Cor do ícones do carroussel, adaptado ao tema
    Color iconColor = Theme.of(context).brightness == Brightness.light
        ? Color(0xFF032156)
        : Color(0xFFFFFFFF);

    return GestureDetector(
      //O texto do item é capturado =>  widget.item['text']
      onTap: () => _handleItemClick(context, widget.item['text']),

      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //////////////////////////////////////////////////////////////
            Text(
              widget.item['text'],
              style: TextStyle(fontSize: 26.4, color: textColor),
            ),

            /////////////////////////////////////////////////////////////
            // TRECHO DE CÓDIGO DOS ÍCONES DO CARROSSEL
            SvgPicture.asset(widget.item['icon'],
                width: 86.0,
                height: 86.0,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn)),
            //////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////////////////////////
  void _handleItemClick(BuildContext context, String itemText) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color(0xFF032156),
      content: Text(
        mensagens[indiceMensagem],
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.blue,
        ),
      ),
      duration: const Duration(seconds: 1),
    ));

    //Increcenta +1 a cada vez que o item for clicado, para exibir frases distintas
    setState(() {
      indiceMensagem = (indiceMensagem + 1) % mensagens.length;
    });

    //Descrição:
    //texts => Lista de contendo todos os textos localizada em: texts.dart
    //text => Chave padrão que assumirá os valores de _itemGiras e _itemGeral
    //text => Só existe e, carousel.dart (Atenção: Não confundir com texts!)
    //itemText => São as chaves contendo os textos-títulos do carrossel

    String textContent = texts[itemText] ?? 'Texto não encontrado';
    String? imagePath;

    print(itemText); //DEBUG: Não apagar

    //imagePath vai receber o caminho da imagem de acordo com o itemText selecionado no carrossel
    if (itemText == 'Jardim de Aruanda')
      imagePath = 'assets/images/png/jardimDeAruanda.png';
    else if (itemText == 'Gira Cigana')
      imagePath = 'assets/images/png/giraCigana.png';
    else if (itemText == 'Gira de Cura')
      imagePath = 'assets/images/png/giraDeCura.png';

    ///
    else if (itemText == 'Umbanda Pet')
      imagePath = 'assets/images/png/umbandaPet.png';
    else if (itemText == 'Sagrado Feminino')
      imagePath = 'assets/images/png/sagradoFeminino.png';
    else if (itemText == 'Gira das Bruxas')
      imagePath = 'assets/images/png/giraDasBruxas.png';
    else if (itemText == 'TVB Verde')
      imagePath = 'assets/images/png/tvbVerde.png';
    else if (itemText == 'Medicinas')
      imagePath = 'assets/images/png/medicinas.png';
    else if (itemText == 'Pontos do Terreiro')
      imagePath = 'assets/images/png/pontosDoTerreiro.png';
    else if (itemText == 'Nossa História')
      imagePath = 'assets/images/png/bkg.png';
    else
      imagePath = 'assets/images/svg/logo.svg';

    String extension = path.extension(imagePath);
    print(
        extension); /////////////////////////////////<<<<<<<<<<<<<<<<<<<<<<<<<<<<

    //Tempo de transição entre o clique no item e abertura de DatailPage
    Future.delayed(const Duration(milliseconds: 500), () {
      //definir tempo

      //////////////////////////////////////////////////////////////////////////
      Navigator.push(
        //A partir daqui, a pagina de detalhes é carregada
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            title: itemText,
            imagePath: imagePath ?? '', //Imagem a ser carregada
            textContent: textContent, //Texto a ser carregado
          ),
        ),
      );
      //////////////////////////////////////////////////////////////////////////
    });
  }
}

////////////////////////////////////////////////////////////////////////////////
//Setup do carrossel
class DelayedCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final Duration delay;

  const DelayedCarousel({super.key, required this.items, required this.delay});

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
              reverse: true,
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
////////////////////////////////////////////////////////////////////////////////

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
                          onPressed: () {}, // Ação ao pressionar o botão
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
