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
  String? fullName;
  String? noHp;
  String? address;
  bool isUpdating = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUsers?>(context);

    return loading ? Loading() : StreamBuilder<UserData>(
      stream: DatabaseService(uid: user?.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData? userData = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 98, 184, 101),
              foregroundColor: Colors.white,
              title: Text(
                'Data Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Freeze Container
                  Container(
                    height: 150,
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
                          isUpdating: isUpdating,
                          onChanged: (newValue) {
                            setState(() => fullName = newValue,);
                          },
                        ),
                        ProfileField(
                          icon: Icons.phone,
                          label: 'No Handphone',
                          initialValue: '${userData?.noHp}',
                          isUpdating: isUpdating,
                          onChanged: (newValue) {
                            setState(() => noHp = newValue,);
                          },
                        ),
                        ProfileField(
                          icon: Icons.email,
                          label: 'Email',
                          initialValue: '${userData?.email}',
                          isUpdating: false,
                          onChanged: (newValue) {
                            
                          },
                        ),
                        ProfileField(
                          icon: Icons.location_on,
                          label: 'Alamat',
                          initialValue: '${userData?.address}',
                          isUpdating: isUpdating,
                          onChanged: (newValue) {
                            setState(() => address = newValue,);
                          },
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (isUpdating) {
                        setState(() => loading = true,);
                        await DatabaseService(uid: user?.uid).updateUserData(
                            fullName: fullName,
                            noHp: noHp,
                            address: address
                        );
                      }
                      setState(() => loading =false,);
                      setState(() {
                        isUpdating = !isUpdating;
                      });
                    },
                    child: Text(
                      isUpdating ? 'Done' : 'Update Profile',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                        Size(200, 30.0), // Sesuaikan lebar dan tinggi sesuai kebutuhan
                      ),
                      shadowColor: MaterialStateProperty.all(Colors.white),
                      overlayColor: MaterialStateProperty.all(Colors.green),
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 99, 157, 100)),
                      surfaceTintColor: MaterialStateProperty.all(Colors.white)
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
