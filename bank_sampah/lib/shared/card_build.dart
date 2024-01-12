import 'package:flutter/material.dart';

class CardProfileSetting extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CardProfileSetting({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      child: Card(
        color: Color.fromARGB(255, 98, 184, 101),
        shadowColor: Colors.white,
        margin: EdgeInsets.all(0.0),
        child: ListTile(
          title: Text(
            '$text',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
          onTap: onTap
        ),
        elevation: 4.0,
      ),
    );
  }
}