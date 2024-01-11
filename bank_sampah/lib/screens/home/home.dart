import 'package:bank_sampah/screens/home/profile.dart';
import 'package:bank_sampah/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.green,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Tambahkan navigasi ke halaman "Person" di sini jika diperlukan
          // misalnya, jika _currentIndex == 3
        },
        items: [
          Icon(Icons.home, color: Colors.green,),
          Icon(Icons.recycling, color: Colors.green),
          Icon(Icons.paste, color: Colors.green),
          Icon(Icons.person, color: Colors.green),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // Tambahkan logika untuk membangun konten berdasarkan _currentIndex di sini
    switch (_currentIndex) {
      case 0:
        return Profile(); // Gantilah dengan widget untuk halaman "Home"
      case 1:
        return Profile(); // Gantilah dengan widget untuk halaman "Recycling"
      case 2:
        return Profile(); // Gantilah dengan widget untuk halaman "Paste"
      case 3:
        return Profile(); // Gantilah dengan widget untuk halaman "Person"
      default:
        return Container();
    }
  }
}

