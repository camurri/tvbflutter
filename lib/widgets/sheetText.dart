import 'package:flutter/material.dart';

class MySheetText extends StatelessWidget {

  final String textContent;
  const MySheetText({super.key, required this.textContent});

  @override
  Widget build(BuildContext context) {
    return  Text(
      textContent,
      style: TextStyle(
        fontSize: 22,
        height: 1.5,
        color: Theme.of(context).textTheme.bodyLarge?.color ??
            Colors.black,
      ),
    );
  }
}


