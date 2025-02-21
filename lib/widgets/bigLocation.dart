import'package:flutter/material.dart';

bool? pressed;

class BigLocation extends StatelessWidget {
  final dynamic pressed;

  const BigLocation({super.key, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {pressed;},
      icon: Icon(
        Icons.location_on,
        size: 86.0,
        color: Theme.of(context).textTheme.bodyLarge?.color ??
            Color(0xFF032156),
      ),
    );
  }
}
