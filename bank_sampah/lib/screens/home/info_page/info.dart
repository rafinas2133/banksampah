import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Informasi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 31, 171, 136),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: recyclingInfo.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color.fromARGB(255, 97, 186, 122),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      recyclingInfo[index],
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<String> recyclingInfo = [
    'Sampah dapat bernilai! Serahkan sampah plastik, kertas, dan logam di Bank Sampah untuk mendukung lingkungan dan dapatkan imbalan. Bersama kita kurangi limbah, tingkatkan kesejahteraan.',
    'Sampah adalah material sisa yang dihasilkan dari aktivitas sehari-hari manusia. Pemahaman tentang jenis sampah membantu dalam pemilahan dan pengelolaannya.',
    'Bank sampah membantu mengurangi dampak negatif sampah terhadap lingkungan. Dengan mendaur ulang, kita dapat mengurangi limbah dan menghasilkan produk yang bernilai.',
    'Prinsip dasar pengelolaan sampah, yakni mengurangi produksi sampah, memanfaatkan kembali barang, dan mendaur ulang material untuk mengurangi pemakaian sumber daya alam.',
    'Bank sampah tidak hanya sebagai tempat pengumpulan, tapi juga sebagai pusat edukasi. Memberikan informasi kepada masyarakat tentang pentingnya pengelolaan sampah untuk menciptakan lingkungan yang lebih bersih dan sehat.'
  ];
}

void main() {
  runApp(MaterialApp(
    home: Information(),
  ));
}
