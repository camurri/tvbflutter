import 'package:flutter/material.dart';
import 'package:app_tvb/widgets/carousel_slider.dart';
import 'package:app_tvb/utils/nav.dart';
import 'package:app_tvb/pages/giras.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xFF032156),
        title: const Text('TVB Digital'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/logo.png', height: 200),
            CarouselWidget(),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  // onPressed: null,
                    onPressed: () => navTo(context, Giras()),
                    child: Text(
                      'WathsApp',
                      style: TextStyle(color: Color(0xFF032156)),

                    )),
                ElevatedButton(
                    onPressed: null,
                    child: Text(
                      'Instagram',
                      style: TextStyle(color: Color(0xFF032156)),
                    )),
                ElevatedButton(
                    onPressed: null,
                    child: Text(
                      'Facebook',
                      style: TextStyle(color: Color(0xFF032156)),
                    )),

              ],
            ),
            SizedBox(height: 10),
            Text('Rua Meciacú 1500 - Jardim de Aruanda - Campinas'),
          ],
        ),
      ),
    );
  }
}
