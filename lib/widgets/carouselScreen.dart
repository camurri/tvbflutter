import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path/path.dart' as path;
import 'package:app_tvb/texts/texts.dart';
import 'package:app_tvb/widgets/mediunDivider.dart';
import 'carouselWidget.dart';
import 'detailPage.dart';

////////////////////////////////////////////////////////////
class CarouselScreen extends StatelessWidget {
  CarouselScreen({super.key});

  //Aqui é contruida a estrutura contendo dois carrosseis dentro de
  //Uma coluna
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // Coluna de organização dos carrosseis
        children: [
          //Carrossel superior
          CarouselWidget(
            items: _itemsGeral,
            delay: const Duration(seconds: 1), reverse: true,
          ),
          MediunDivider(),
          //Carrossel inferior
          CarouselWidget(
            items: _itemsGiras,
            delay: const Duration(seconds: 1), reverse: false,
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

  //Aqui trata-se apenas das imagens dos items do carrossel em formato .svg
  final List<Map<String, dynamic>> _itemsGeral = [
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

    print(itemText); //do not erase this for while

    //imagePath vai receber o caminho da imagem de acordo com o itemText selecionado no carrossel
    if (itemText == 'Jardim de Aruanda')
      imagePath = 'assets/images/png/jardimDeAruanda.png';
    else if (itemText == 'Gira Cigana')
      imagePath = 'assets/images/png/giraCigana.png';
    else if (itemText == 'Gira de Cura')
      imagePath = 'assets/images/png/giraDeCura.png';
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
      imagePath = 'assets/images/svg/coco.svg';

    String extension = path.extension(imagePath);
    print(
        extension); /////////////////////////////////<<<<<<<<<<<<<<<<<<<<<<<<<<<<

    //Tempo de transição entre o clique no item e abertura de DatailPage
    Future.delayed(
      const Duration(seconds: 1),
      () {
        //definir tempo

        //////////////////////////////////////////////////////////////////////////
        Navigator.push(
          //DetailPage() starts here é
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
      },
    );
  }
}


