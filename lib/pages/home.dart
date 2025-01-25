import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial - Em breve'), // Título da barra de navegação
      ),
      body: Center(
          child: Column(
        children: [
          Text('Em construção, seja paciente'),
          Text('tome um café enquanto espera!'),
          const IconButton(
              onPressed: null, icon: Icon(Icons.local_cafe_outlined)),
          Row(
            //Snack Bar
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const IconButton(
                  onPressed: null, icon: Icon(Icons.facebook_outlined)),
              const IconButton(
                  onPressed: null, icon: Icon(Icons.home_outlined)),
              const IconButton(
                  onPressed: null, icon: Icon(Icons.message_outlined)),
            ],
          )
        ],
      )),
    );
  }
}
