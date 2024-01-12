import 'package:flutter/material.dart';

class Recycling extends StatefulWidget {
  const Recycling({super.key});

  @override
  State<Recycling> createState() => _RecyclingState();
}

class _RecyclingState extends State<Recycling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recycle'),),
    );
  }
}