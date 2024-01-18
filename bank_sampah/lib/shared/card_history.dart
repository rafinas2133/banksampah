import 'package:flutter/material.dart';

class CardHistory extends StatefulWidget {
  final VoidCallback onCompleted;

  const CardHistory({Key? key, required this.onCompleted}) : super(key: key);

  @override
  State<CardHistory> createState() => _CardHistoryState();
}

class _CardHistoryState extends State<CardHistory> {
  @override
  Widget build(BuildContext context) {
    return Card(
            margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            color: Colors.white,
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.recycling,
                            size: 60,
                            color: Colors.green,
                          ),
                          SizedBox(width: 20.0,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jual sampah',
                                style:TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text('tanggal'),
                              Text('id')
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Jumlah Poin',
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                      ),
                      Text(
                        '150',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          fixedSize: MaterialStateProperty.all(
                            Size(120, 8)
                          ),
                          elevation: MaterialStateProperty.all(5.0)
                        ),
                        onPressed: () {
                          widget.onCompleted();
                        },
                        child: Text('Selesai'),
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          foregroundColor: MaterialStateProperty.all(Colors.green),
                          fixedSize: MaterialStateProperty.all(
                            Size(120, 8)
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                            side: BorderSide(color: Colors.green), // Warna outline
                            borderRadius: BorderRadius.circular(20.0), // Radius sudut border
                            ),
                          ),
                          elevation: MaterialStateProperty.all(5.0)
                        ),
                        onPressed: () {
                          
                        },
                        child: Text('Jual Lagi'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}