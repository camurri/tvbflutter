import'package:flutter/material.dart';


class BigLocation extends StatelessWidget {
  final VoidCallback? pressed;

  const BigLocation({super.key, this.pressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: pressed,
      icon: Icon(
        Icons.location_on,
        size: 86.0,
        color: Theme.of(context).iconTheme.color
      ),
    );
  }
}
