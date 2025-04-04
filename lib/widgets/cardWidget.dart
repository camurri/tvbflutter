import 'package:app_tvb/widgets/cardwidget.dart';
import 'package:flutter/material.dart';
import 'package:app_tvb/widgets/imageLoader.dart';

class Cardwidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onTap;

  const Cardwidget({
    super.key,
    required this.title,
    required this.iconPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 60,
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ImageLoader(
              logoSize: 35,
              path: iconPath,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            const SizedBox(width: 12),
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
