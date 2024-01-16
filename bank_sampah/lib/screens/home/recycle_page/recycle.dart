import 'package:flutter/material.dart';

class Recycling extends StatefulWidget {
  const Recycling({super.key});

  @override
  State<Recycling> createState() => _RecyclingState();
}

class _RecyclingState extends State<Recycling> {
  final List<String> berat = ['1-2', '3-4', '5-6'];
  final List<String> sampah = ['Plastik', 'Besi', 'Dildo'];
  String? _currentBerat;
  String? _currentSampah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Recycle')),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jenis Sampah',style: TextStyle(fontSize: 20),),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Card(
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            hintText: 'Pilih jenis sampah',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen, width: 2.0)
                          ),
                          ),
                          items: sampah.map((sampah) {
                            return DropdownMenuItem(
                              value: sampah,
                              child: Text('$sampah'),
                            );
                          }).toList(),
                          onChanged: (val) => setState(() => _currentSampah = val),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text('Berat Sampah',style: TextStyle(fontSize: 20),),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Card(
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            hintText: 'Pilih berat sampah',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen, width: 2.0)
                          ),
                          ),
                          items: berat.map((berat) {
                            return DropdownMenuItem(
                              value: berat,
                              child: Text('$berat kg'),
                            );
                          }).toList(),
                          onChanged: (val) => setState(() => _currentBerat = val),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text('Foto Sampah',style: TextStyle(fontSize: 20),),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Card(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Upload foto sampah anda',
                            // suffixIcon: imah,
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0)
                          ),
                          suffixIcon: Icon(Icons.camera_alt)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text('Alamat Penjemputan',style: TextStyle(fontSize: 20),),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Card(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Masukkan Alamat Anda',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen, width: 2.0)
                          ),
                          suffixIcon: Icon(Icons.map_sharp)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text('Jadwal Penjemputan',style: TextStyle(fontSize: 20),),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Card(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Masukkan Tanggal Penjemputan',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen, width: 2.0)
                          ),
                          suffixIcon: Icon(Icons.calendar_month)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Card(
                        child: TextFormField(
                          initialValue: '',
                          decoration: InputDecoration(
                            hintText: 'Masukkan Jam Penjemputan',
                            fillColor:Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 2.0)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightGreen, width:2.0)
                            ),
                            suffixIcon: Icon(Icons.punch_clock)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text('No Handphone',style: TextStyle(fontSize: 20),),
              Center(
                child: Container(
                  child: Column(
                    children: [
                      Card(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Masukkan no handphone anda',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightGreen, width: 2.0)
                          ),
                          suffixIcon: Icon(Icons.phone)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {}, 
                  child: Text('Selesai'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                  ), 
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}