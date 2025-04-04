import 'package:flutter/material.dart';
import 'package:app_tvb/widgets/imageLoader.dart';

class Cardwidget extends StatelessWidget {
  const Cardwidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 50,
        width: 400,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        color: Colors.indigo,
        child: Row(
          children: const [
            ImageLoader(
              logoSize: 35,
              path: 'assets/images/svg/pray.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn), // <-- Agora funciona!
            ),
            SizedBox(width: 8),
            Text('Title', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
