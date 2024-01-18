import 'package:bank_sampah/shared/card_history.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  List<int> _data = [1, 2, 3, 4]; 

  void _removeCard(int index) {
    setState(() {
      _data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Riwayat'),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return CardHistory(
            onCompleted: () => _removeCard(index),
          );
        },
      ),
    );
  }
}
