import 'package:flutter/material.dart';

class MyTextButtonTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButtonTheme(
      data: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Colors.blue, // Cor de fundo
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0), // Padding do botão
          shape: RoundedRectangleBorder( // Forma do botão
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: Center(
        child: TextButton(
          onPressed: () {
            // Lógica ao pressionar o botão
          },
          child: const Text('Texto do botão'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('TextButtonTheme Example')),
      body: MyTextButtonTheme(), // Usando o widget com tema
    ),
  ));
}

