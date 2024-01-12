import 'package:bank_sampah/screens/home/home.dart';
import 'package:bank_sampah/screens/home/info_page/info.dart';
import 'package:bank_sampah/screens/home/profile.dart';
import 'package:bank_sampah/screens/home/recycle_page/recycle.dart';
import 'package:bank_sampah/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  //final AuthService _auth = AuthService();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.green,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Tambahkan navigasi ke halaman "Person" di sini jika diperlukan
          // misalnya, jika _currentIndex == 3
        },
        items: [
          Icon(Icons.home, color: Colors.white,),
          Icon(Icons.recycling, color: Colors.white),
          Icon(Icons.paste, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // Tambahkan logika untuk membangun konten berdasarkan _currentIndex di sini
    switch (_currentIndex) {
      case 0:
        return Home(); // Gantilah dengan widget untuk halaman "Navbar"
      case 1:
        return Recycling(); // Gantilah dengan widget untuk halaman "Recycling"
      case 2:
        return Info(); // Gantilah dengan widget untuk halaman "Paste"
      case 3:
        return Profile(); // Gantilah dengan widget untuk halaman "Person"
      default:
        return Container();
    }
  }
}

