import 'package:flutter/material.dart';

class IconButtonSub extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const IconButtonSub({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
        icon: Icon(
          Icons.circle,
          size: 50.0,
        ),
        onPressed: onTap,
      ),
      Text(
        '$text',
        style: TextStyle(
          color: Colors.green,
          fontSize: 18.0,
          fontWeight: FontWeight.bold
        ),
      ),
      ],
    );
  }
}