import 'package:flutter/material.dart';
import 'package:app_tvb/widgets/cardwidget.dart';

class ContentListPage extends StatelessWidget {
  final String pageTitle;
  final List<Map<String, String>> items;

  const ContentListPage({
    super.key,
    required this.pageTitle,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageTitle)),
      body: ListView(
        children: items.map((item) {
          return Cardwidget(
            title: item['title']!,
            iconPath: item['icon']!,
            onTap: () {
              // Aqui você pode navegar para uma página de detalhes, por exemplo
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(title: Text(item['title']!)),
                    body: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(item['content'] ?? 'Sem conteúdo.'),
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
