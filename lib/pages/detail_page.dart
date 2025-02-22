import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String textContent;
  final String imagePath;
  final Widget weekEventsWidget;

  const DetailPage({
    super.key,
    required this.title,
    required this.textContent,
    required this.imagePath,
    required this.weekEventsWidget,
  });

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

                    //Neste caso, a largura da imagem será 80% da largura da tela, e a altura
                    // será proporcional a essa largura, com uma razão de aspecto de 0.6
                    // (ou seja, a altura será 60% da largura da imagem).
                    width: MediaQuery.of(context).size.width * 0.8, // Largura adaptada
                    height: MediaQuery.of(context).size.width * 0.8 * 0.6, // Altura proporcional
                    
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).brightness == Brightness.light
                          ? Color(0xFF032156)
                          : Color(0xFFFFFFFF),
                      BlendMode.srcIn,
                    ),
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
                    color: Theme.of(context).textTheme.bodyLarge?.color ??
                        Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                // Renderiza o WeekEventsScreen diretamente sem Expanded
                weekEventsWidget,
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
