import 'package:bank_sampah/models/myuser.dart';
import 'package:bank_sampah/services/auth.dart';
import 'package:bank_sampah/services/database.dart';
import 'package:bank_sampah/shared/loading.dart';
import 'package:bank_sampah/shared/profile_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataProfile extends StatefulWidget {
  const DataProfile({Key? key});

  @override
  State<DataProfile> createState() => _DataProfileState();
}

class _DataProfileState extends State<DataProfile> {

  final AuthService _auth = AuthService();
  String? userName;
  String? fullName;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUsers?>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user?.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData? userData = snapshot.data;
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  // Freeze Container
                  Container(
                    height: 180,
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
                          Text(
                            'Data Profile',
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
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ProfileField(
                          icon: Icons.person,
                          label: 'Nama Lengkap',
                          initialValue: '${userData?.fullName}',
                          onChanged: (newValue) {
                            // Lakukan sesuatu dengan nilai yang diubah
                            print('Nama Lengkap diubah menjadi: $newValue');
                          },
                        ),
                        ProfileField(
                          icon: Icons.phone,
                          label: 'No Handphone',
                          initialValue: '${userData?.noHp}',
                          onChanged: (newValue) {
                            // Lakukan sesuatu dengan nilai yang diubah
                            print('No Handphone diubah menjadi: $newValue');
                          },
                        ),
                        ProfileField(
                          icon: Icons.email,
                          label: 'Email',
                          initialValue: '${userData?.email}',
                          onChanged: (newValue) {
                            // Lakukan sesuatu dengan nilai yang diubah
                            print('Email diubah menjadi: $newValue');
                          },
                        ),
                        ProfileField(
                          icon: Icons.location_on,
                          label: 'Alamat',
                          initialValue: '${userData?.address}',
                          onChanged: (newValue) {
                            // Lakukan sesuatu dengan nilai yang diubah
                            print('Alamat diubah menjadi: $newValue');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Loading();
        }
      }
    );
  }
}
