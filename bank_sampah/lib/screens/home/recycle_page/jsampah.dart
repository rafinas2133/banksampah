import 'package:bank_sampah/shared/cons.dart';
import 'package:flutter/material.dart';

class Jsampah extends StatefulWidget {
  const Jsampah({super.key});

  @override
  State<Jsampah> createState() => _JsampahState();
}

class _JsampahState extends State<Jsampah> {
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
                  imageas: 'asset/download.jpeg',
                ),
                Cartsampah(
                  title: 'Kertas',
                  imageas: 'asset/kertas.jpeg',
                )
              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Cartsampah(
                  title: 'Kaleng',
                  imageas: 'asset/kaleng.jpg',
                ),
                Cartsampah(
                  title: 'Botol',
                  imageas: 'asset/botol.jpeg',
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
                  imageas: 'asset/besi.jpeg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}