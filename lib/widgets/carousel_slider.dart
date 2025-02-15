import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_tvb/texts/texts.dart'; // Verifique se o caminho da importação está correto

class CarouselWidget extends StatelessWidget {
  CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DelayedCarousel(
            items: _itemsGeral,
            delay: const Duration(milliseconds: 500),
          ),
          DelayedCarousel(
            items: _itemsGiras,
            delay: const Duration(milliseconds: 500),
          ),
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> _itemsGeral = [
    {'text': 'Como chegar?', 'icon': 'assets/images/svg/road.svg'},
    {'text': 'Giras da Semana', 'icon': 'assets/images/svg/schedule.svg'},
    {'text': 'Pontos do terreiro', 'icon': 'assets/images/svg/african-drum.svg'},
    {'text': 'Orações', 'icon': 'assets/images/svg/pray.svg'},
    {'text': 'Redes Sociais', 'icon': 'assets/images/svg/social-media.svg'},
  ];

  final List<Map<String, dynamic>> _itemsGiras = [
    {'text': 'Jardim de Aruanda', 'icon': 'assets/images/svg/reading.svg'},
    {'text': 'Gira Cigana', 'icon': 'assets/images/svg/fire.svg'},
    {'text': 'Gira de Cura', 'icon': 'assets/images/svg/pray.svg'},
    {'text': 'Umbanda Pet', 'icon': 'assets/images/svg/dog.svg'},
    {'text': 'Sagrado Feminino', 'icon': 'assets/images/svg/flower.svg'},
    {'text': 'Gira das Bruxas', 'icon': 'assets/images/svg/spell-book.svg'},
  ];
}

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

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    Color iconColor = Theme.of(context).brightness == Brightness.light
        ? Color(0xFF032156)
        : Color(0xFFFFFFFF);

    return GestureDetector(
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
            Text(
              widget.item['text'],
              style: TextStyle(fontSize: 30.0, color: textColor),
            ),
            SvgPicture.asset(
              widget.item['icon'],
              width: 86.0,
              height: 86.0,
              color: iconColor,
            ),
          ],
        ),
      ),
    );
  }

  void _handleItemClick(BuildContext context, String itemText) {
    // Exibe a mensagem atual do snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF032156),
        content: Text(mensagens[indiceMensagem], textAlign: TextAlign.center),
        duration: const Duration(seconds: 1),
      ),
    );

    setState(() {
      indiceMensagem = (indiceMensagem + 1) % mensagens.length;
    });

    // Obtém o conteúdo de texto e imagem a partir do mapa de textos
    String textContent = texts[itemText] ?? 'Texto não encontrado em (detail_page.dart)';
    String imagePath = 'assets/images/svg/logo.svg'; // Fallback de imagem

    // Lógica para pegar dados do item
    if (itemText == 'Jardim de Aruanda') {
      imagePath = 'assets/images/svg/dog.svg'; // Ajuste da imagem caso o item seja Jardim de Aruanda
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            title: itemText,
            textContent: textContent,
            imagePath: imagePath,
          ),
        ),
      );
    });
  }
}

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
              enlargeCenterPage: true,
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

class DetailPage extends StatelessWidget {
  final String title;
  final String textContent;
  final String imagePath;

  const DetailPage({super.key, required this.title, required this.textContent, required this.imagePath});

  @override
  Widget build(BuildContext context) {
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
                  borderRadius: BorderRadius.circular(20.0),
                  child: SvgPicture.asset(
                    imagePath,
                    height: 400,
                    fit: BoxFit.cover,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Color(0xFF032156)
                        : Color(0xFFFFFFFF),
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  textContent,
                  style: TextStyle(
                    fontSize: 22,
                    height: 1.5,
                    color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
                  ),
                ),
                if (title == 'Como chegar?')
                  IconButton(
                    onPressed: () {
                      // Lógica de navegação ou abrir mapa
                    },
                    icon: const Icon(
                      Icons.location_on,
                      size: 86.0,
                      color: Color(0xFF032156),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
