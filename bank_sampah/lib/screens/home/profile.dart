import 'package:bank_sampah/models/myuser.dart';
import 'package:bank_sampah/screens/home/profile_page/data_profil.dart';
import 'package:bank_sampah/services/auth.dart';
import 'package:bank_sampah/services/database.dart';
import 'package:bank_sampah/shared/card_build.dart';
import 'package:bank_sampah/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final AuthService _auth = AuthService();
  String? userName;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUsers?>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user?.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData? userData = snapshot.data;
          return Column(
            children: [     
              // Freeze Container
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 98, 184, 101),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20.0,),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      CircleAvatar(
                        radius: 50,
                        child: Icon(
                          Icons.person,
                          size: 100,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        '${userData?.userName}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              // Scrollable Container
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10.0),
                      Text(
                        'Pengaturan',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        child: Card(
                          color: Color.fromARGB(255, 98, 184, 101),
                          child: Column(
                            children: [
                              CardProfileSetting(text: 'Data Profil', onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DataProfile())                
                                );
                                print('test');
                              }),
                              CardProfileSetting(text: 'Notifikasi', onTap: () {}),
                              CardProfileSetting(text: 'Bahasa', onTap: () {}),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Bantuan',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        child: Card(
                          color: Color.fromARGB(255, 98, 184, 101),
                          child: Column(
                            children: [
                              CardProfileSetting(text: 'F.A.Q', onTap: () {}),
                              CardProfileSetting(text: 'Pusat Bantuan', onTap: () {}),
                              CardProfileSetting(text: 'Tentang Aplikasi', onTap: () {}),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size(250, 30.0)),
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 98, 184, 101))
                        ),
                        onPressed: () async {
                          // Tambahkan logika logout jika diperlukan
                          await _auth.signOut();
                        },
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 3.0
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0,)
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Loading();
        }
      }
    );
  }
}
