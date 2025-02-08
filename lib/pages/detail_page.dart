import 'package:flutter/material.dart';
import 'package:app_tvb/texts/texts.dart'; // Ajuste o caminho conforme necessário

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
      'Orações': {
        'text': texts['Orações'] ?? 'Texto não encontrado.',
        'image': 'assets/images/pray.png',
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
                    height: 400,
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
                    fontSize: 22,
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
