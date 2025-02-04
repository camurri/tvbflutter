import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_tvb/texts/texts.dart'; // Supondo que este arquivo existe

void main() {
  runApp(MaterialApp(
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
    {'text': 'Como chegar?', 'icon': Icons.location_on},
    {'text': 'Giras da Semana', 'icon': Icons.access_time_outlined},
    {'text': 'Pontos do terreiro', 'icon': Icons.library_music},
    {'text': 'Redes Sociais', 'icon': Icons.facebook},
  ];

  // Lista de itens para o segundo carrossel
  final List<Map<String, dynamic>> _itemsGiras = [
    {'text': 'Jardim de Aruanda', 'icon': Icons.bedroom_baby_outlined},
    {'text': 'Gira Cigana', 'icon': Icons.star_border_outlined},
    {'text': 'Gira de Cura', 'icon': Icons.heart_broken},
    {'text': 'Umbanda Pet', 'icon': Icons.pets},
    {'text': 'Sagrado Feminino', 'icon': Icons.woman},
    {'text': 'Gira das Bruxas', 'icon': Icons.star_border_outlined},
  ];
}

// Widget para cada item do carrossel
class CarouselItem extends StatelessWidget {
  final Map<String, dynamic> item;

  const CarouselItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleItemClick(context, item['text']),
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
              item['text'],
              style: const TextStyle(fontSize: 32.0, color: Color(0xFF032156)),
            ),
            Icon(
              item['icon'],
              size: 86.0,
              color: const Color(0xFF032156),
            ),
          ],
        ),
      ),
    );
  }

  void _handleItemClick(BuildContext context, String itemText) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF035653),
        content: Text('Você clicou em: $itemText'),
        duration: const Duration(seconds: 2),
      ),
    );

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
        'image': 'assets/images/giraCigana.png',
      },
      'Umbanda Pet': {
        'text': texts['Umbanda Pet'] ?? 'Texto não encontrado.',
        'image': 'assets/images/umbandaPet.png',
      },
      'Gira de Cura': {
        'text': texts['Gira de Cura'] ?? 'Texto não encontrado.',
        'image': 'assets/images/giraDeCura.png',
      },
      'Jardim de Aruanda': {
        'text': texts['Jardim de Aruanda'] ?? 'Texto não encontrado.',
        'image': 'assets/images/jardimDeAruanda.png',
      },
      'Gira das Bruxas': {
        'text': texts['Gira das Bruxas'] ?? 'Texto não encontrado.',
        'image': 'assets/images/giraDasBruxas.png',
      },
      'Como chegar?': {
        'text': texts['Como chegar?'] ?? 'Texto não encontrado.',
        'image': 'assets/images/logo.png',
      },
      'Sagrado Feminino': {
        'text': texts['Sagrado Feminino'] ?? 'Texto não encontrado.',
        'image': 'assets/images/sagradoFeminino.png',
      },
      'Giras da Semana': {
        'text': texts['Giras da Semana'] ?? 'Texto não encontrado.',
        'image': 'assets/images/logo.png',
      },
      'Pontos do terreiro': {
        'text': texts['Pontos do terreiro'] ?? 'Texto não encontrado.',
        'image': 'assets/images/curimbaSeoSete.png',
      },
      'Redes Sociais': {
        'text': texts['Redes Sociais'] ?? 'Texto não encontrado.',
        'image': 'assets/images/redesSociais.png',
      },
    };

    final details = itemDetails[title] ?? {
      'text': 'Texto ainda não implementado',
      'image': 'assets/images/logo.png', // Imagem padrão
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
                  child: Image.asset(
                    imagePath,
                    height: 500,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error); // Fallback para erro
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  textContent,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Color(0xFF032156),
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