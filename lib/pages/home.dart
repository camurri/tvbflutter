import 'package:flutter/material.dart';
import 'package:app_tvb/widgets/carousel_slider.dart';

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
            Image.asset('assets/images/logo.png'),
            CarouselWidget(),

            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                ElevatedButton(onPressed: null, child: Text('WathsApp', )),
                ElevatedButton(onPressed: null, child: Text('Instagram')),
                ElevatedButton(onPressed: null, child: Text('Facebook')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
