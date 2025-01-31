import 'package:flutter/material.dart';

class Giras extends StatelessWidget {
  const Giras({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giras'),
        foregroundColor: const Color(0xFF032156),
      ),
      body: const Center(child: Column(
        children: [
         Text('data', style: TextStyle(fontSize: 20))
        ],
      ),),

    );
  }
}