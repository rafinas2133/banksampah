import 'package:bank_sampah/models/myuser.dart';
import 'package:bank_sampah/screens/authenticate/authenticate.dart';
import 'package:bank_sampah/screens/home/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUsers?>(context);

    //return to home or auth
    if(user == null){
      return Authenticate();
    }else {
      return Navbar();
    }
  }
}