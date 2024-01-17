import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  @override
  InformasiScreenState createState() => InformasiScreenState();
}

class InformasiScreenState extends State<Information> {
  List<String> recyclingInfo = [
    'Daur ulang penting bagi lingkungan dan umat manusia di masa depan',
    'Daur ulang penting bagi lingkungan dan umat manusia di masa depan',
    'Daur ulang penting bagi lingkungan dan umat manusia di masa depan',
    'Daur ulang penting bagi lingkungan dan umat manusia di masa depan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: recyclingInfo.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 8.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 97, 186, 122),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                recyclingInfo[index],
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Information(),
  ));
}
