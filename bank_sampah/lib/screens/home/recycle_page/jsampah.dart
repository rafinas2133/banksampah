import 'package:bank_sampah/shared/cons.dart';
import 'package:flutter/material.dart';

class Jsampah extends StatefulWidget {
  const Jsampah({super.key});

  @override
  State<Jsampah> createState() => _JsampahState();
}

class _JsampahState extends State<Jsampah> {
  void selectsampah (String sampah)async{
    Navigator.pop(context, {
      'sampah': sampah
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Cartsampah(
                  title: 'Plastik',
                  imageas: 'assets/download.jpeg',
                  ontap: () {
                    setState(() {
                      selectsampah('Plastik');
                    });
                  },
                ),
                Cartsampah(
                  title: 'Kertas',
                  imageas: 'assets/kertas.jpeg',
                  ontap: () {
                    selectsampah('Kertas');
                  }
                )
              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Cartsampah(
                  title: 'Kaleng',
                  imageas: 'assets/kaleng.jpg',
                  ontap: () {
                    selectsampah('Kaleng');
                  }
                ),
                Cartsampah(
                  title: 'Botol',
                  imageas: 'assets/botol.jpeg',
                  ontap: () {
                    selectsampah('Botol');
                  }
                )
              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 30.0),
                Cartsampah(
                  title: 'Besi',
                  imageas: 'assets/besi.jpeg',
                  ontap: () {
                    selectsampah('Besi');
                  }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}