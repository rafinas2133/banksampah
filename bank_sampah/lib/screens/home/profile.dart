import 'package:bank_sampah/services/auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();

    return Center(
      child: ElevatedButton(
        onPressed: () async {
          // Tambahkan logika logout jika diperlukan
          await _auth.signOut();
        },
        child: Text('Logout'),
      ),
    );
  }
}