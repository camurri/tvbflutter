import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Importando a biblioteca flutter_svg
import 'package:app_tvb/texts/texts.dart'; // Supondo que este arquivo existe

void main() {
  runApp(MaterialApp(
    theme: ThemeData.light(), // Tema claro
    darkTheme: ThemeData.dark(), // Tema escuro
    themeMode: ThemeMode.system, // Para usar o tema do sistema
    home: Scaffold(
      body: CarouselWidget(),
    ),
  ));
}

class CarouselWidget extends StatelessWidget {
  CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DelayedCarousel( // Primeiro carrossel com atraso
            items: _itemsGeral,
            delay: const Duration(seconds: 1), // Atraso de 1 segundo
          ),
          const SizedBox(height: 20), // Espaço entre os carrosséis
          DelayedCarousel( // Segundo carrossel com atraso maior
            items: _itemsGiras,
            delay: const Duration(seconds: 3), // Atraso de 3 segundos
          ),
        ],
      ),
    );
  }

  // Lista de itens para o primeiro carrossel
  final List<Map<String, dynamic>> _itemsGeral = [
    {'text': 'Como chegar?', 'icon': 'assets/images/svg/road.svg'},
    {'text': 'Giras da Semana', 'icon': 'assets/images/svg/schedule.svg'},
    {'text': 'Pontos do terreiro', 'icon': 'assets/images/svg/african-drum.svg'},
    {'text': 'Orações', 'icon': 'assets/images/svg/pray.svg'},
    {'text': 'Redes Sociais', 'icon': 'assets/images/svg/social-media.svg'},
  ];

  // Lista de itens para o segundo carrossel
  final List<Map<String, dynamic>> _itemsGiras = [
    {'text': 'Jardim de Aruanda', 'icon': 'assets/images/svg/reading.svg'},
    {'text': 'Gira Cigana', 'icon': 'assets/images/svg/fire.svg'},
    {'text': 'Gira de Cura', 'icon': 'assets/images/svg/pray.svg'},
    {'text': 'Umbanda Pet', 'icon': 'assets/images/svg/dog.svg'},
    {'text': 'Sagrado Feminino', 'icon': 'assets/images/svg/flower.svg'},
    {'text': 'Gira das Bruxas', 'icon': 'assets/images/svg/spell-book.svg'},
  ];
}

// Widget para cada item do carrossel
class CarouselItem extends StatefulWidget {
  final Map<String, dynamic> item;

  const CarouselItem({super.key, required this.item});

  @override
  State<CarouselItem> createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  // Índice da mensagem atual
  int indiceMensagem = 0;

  // Array de mensagens
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
    // Obter a cor do texto de acordo com o tema atual
    Color textColor = Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    Color iconColor = Theme.of(context).brightness == Brightness.light
        ? Color(0xFF032156) // Azul mais escuro para tema claro
        : Colors.white; // Branco para tema escuro

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
              style: TextStyle(fontSize: 30.0, color: textColor), // Usando a cor do tema
            ),
            SvgPicture.asset(
              widget.item['icon'], // Usando a imagem SVG
              width: 86.0,
              height: 86.0,
              color: iconColor, // A cor dinâmica do ícone baseada no tema
            ),
          ],
        ),
      ),
    );
  }

  void _handleItemClick(BuildContext context, String itemText) {
    // Exibe a mensagem atual
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF032156),
        content: Text(mensagens[indiceMensagem], textAlign: TextAlign.center),
        duration: const Duration(seconds: 2),
      ),
    );

    // Atualiza o índice para a próxima mensagem, independentemente do item
    setState(() {
      indiceMensagem = (indiceMensagem + 1) % mensagens.length;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(title: itemText),
        ),
      );
    });
  }
}

// Widget para carrossel com atraso
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
          duration: const Duration(seconds: 1), // Duração da animação
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

// Página de detalhes
class DetailPage extends StatelessWidget {
  final String title;

  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final Map<String, Map<String, String>> itemDetails = {
      'Gira Cigana': {
        'text': texts['Gira Cigana'] ?? 'Texto não encontrado.',
        'image': 'assets/images/svg/giraCigana.svg',
      },
      'Umbanda Pet': {
        'text': texts['Umbanda Pet'] ?? 'Texto não encontrado.',
        'image': 'assets/images/svg/umbandaPet.svg',
      },
      'Gira de Cura': {
        'text': texts['Gira de Cura'] ?? 'Texto não encontrado.',
        'image': 'assets/images/svg/giraDeCura.svg',
      },
      'Jardim de Aruanda': {
        'text': texts['Jardim de Aruanda'] ?? 'Texto não encontrado.',
        'image': 'assets/images/svg/jardimDeAruanda.svg',
      },
      'Gira das Bruxas': {
        'text': texts['Gira das Bruxas'] ?? 'Texto não encontrado.',
        'image': 'assets/images/svg/giraDasBruxas.svg',
      },
      'Como chegar?': {
        'text': texts['Como chegar?'] ?? 'Texto não encontrado.',
        'image': 'assets/images/svg/logo.svg',
      },
      'Sagrado Feminino': {
        'text': texts['Sagrado Feminino'] ?? 'Texto não encontrado.',
        'image': 'assets/images/svg/sagradoFeminino.svg',
      },
      'Giras da Semana': {
        'text': texts['Giras da Semana'] ?? 'Texto não encontrado.',
        'image': 'assets/images/svg/logo.svg',
      },
      'Pontos do terreiro': {
        'text': texts['Pontos do terreiro'] ?? 'Texto não encontrado.',
        'image': 'assets/images/svg/curimbaSeoSete.svg',
      },
      'Redes Sociais': {
        'text': texts['Redes Sociais'] ?? 'Texto não encontrado.',
        'image': 'assets/images/svg/redesSociais.svg',
      },
      'Orações': {
        'text': texts['Orações'] ?? 'Texto não encontrado.',
        'image': 'assets/images/svg/pray.svg',
      },
    };

    final details = itemDetails[title] ?? {
      'text': 'Texto ainda não implementado',
      'image': 'assets/images/svg/logo.svg', // Imagem padrão
    };

    String textContent = details['text']!;
    String imagePath = details['image']!;

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
                        ? Color(0xFF032156) // Azul mais escuro para tema claro
                        : Colors.white, // Branco para tema escuro
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error); // Fallback para erro
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
