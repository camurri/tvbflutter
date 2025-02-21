import 'package:flutter/material.dart';

class MediunDivider extends StatelessWidget {
  const MediunDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Divider(
      endIndent: 150,
      thickness: 2,
      indent: 150,
      height: 30,
      color: Theme.of(context).textTheme.bodyLarge?.color ??
          Colors.black,
    );
  }
}



