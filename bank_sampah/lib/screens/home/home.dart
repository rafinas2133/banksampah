import 'package:bank_sampah/models/myuser.dart';
import 'package:bank_sampah/services/database.dart';
import 'package:bank_sampah/shared/icon_button_sub.dart';
import 'package:bank_sampah/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? username;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUsers?>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user?.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {

          UserData? userData = snapshot.data;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 98, 184, 101),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0), 
                        bottomRight: Radius.circular(20.0))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                          child: Text(
                            'Selamat datang, ${userData?.userName}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16, 
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
                          child: Text(
                            'Mau jual sampah apa hari ini?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: 'Search...',
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 1)
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.shop, color: Colors.white),
                              onPressed: () {
                                
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.chat, color: Colors.white),
                              onPressed: () {
                                
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.notifications, color: Colors.white),
                              onPressed: () {
                                
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  Card(
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.money, color: Colors.yellow, size: 50.0),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('10000', style: TextStyle(fontSize: 16)),
                                      Text('Tambah Coin', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.circle, color: Colors.blue,size: 50.0),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Rp. 100.000', style: TextStyle(fontSize: 16)),
                                      Text('Top-up Ovo', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Transaksi', style: TextStyle(fontSize: 16)),
                                      Text('Tarik Saldo', style: TextStyle(fontSize: 12, color: Colors.grey)),
                                    ],
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.clean_hands, color: Colors.green,size: 50.0,),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButtonSub(text: 'test', onTap: () {}),
                      IconButtonSub(text: 'test', onTap: () {}),
                      IconButtonSub(text: 'test', onTap: () {}),
                      IconButtonSub(text: 'test', onTap: () {}),
                      IconButtonSub(text: 'test', onTap: () {}),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Kamu Lagi butuh apa ni',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
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