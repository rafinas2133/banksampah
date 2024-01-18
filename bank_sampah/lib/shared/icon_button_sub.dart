import 'package:flutter/material.dart';

class IconButtonSub extends StatelessWidget {
  final String text;
  final String subtext;
  final void Function()? onTap;
  final IconData icon;
  final Color? iconColor;

  const IconButtonSub({
    super.key, 
    required this.text,
    required this.subtext, 
    required this.onTap, 
    required this.icon,
    required this.iconColor
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
        icon: Icon(
          icon,
          color: iconColor,
          size: 50.0,
        ),
        onPressed: onTap,
      ),
      Text(
        '$text',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.normal
        ),
      ),
      Text(
        '$subtext',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.normal
        ),
      ),
      ],
    );
  }
}