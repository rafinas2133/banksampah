import 'package:bank_sampah/services/auth.dart';
import 'package:bank_sampah/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:bank_sampah/shared/constans.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
    String fullName = '';
    String userName = '';
    String email = '';
    String noHp = '';
    String address = '';
    String password = '';
    String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 2.0, 20.0, 0.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Gambar Logo
                Container(
                  width: 450.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bank_sampah_logo.jpeg'), // Gantilah dengan path gambar logo Anda
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
            
                Text(
                  'SIGN UP',
                  style:TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                  ),
                ),
            
                // Input Nama
                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: 'Full Name'),
                  validator: (val) => val!.isEmpty ? 'Enter Full Name' : null,
                  onChanged: (val) {
                    setState(() {
                      fullName = val;
                    });
                  },
                ),
                SizedBox(height: 8.0),
            
                // Input username
                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: 'Username'),
                  validator: (val) => val!.isEmpty ? 'Enter Username' : null,
                  onChanged: (val) {
                    setState(() {
                      userName = val;
                    });
                  },
                ),
                SizedBox(height: 8.0),
            
                // Input NoHandPhone
                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: 'No.Handphone'),
                  validator: (val) => val!.isEmpty ? 'Enter No. Handphone' : null,
                  onChanged: (val) {
                    setState(() {
                      noHp = val;
                    });
                  },
                ),
                SizedBox(height: 8.0),
            
                // Input Email
                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: 'Email'),
                  validator: (val) => val!.isEmpty ? 'Enter Email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 8.0),
            
                // Input Password
                TextFormField(
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(labelText: 'Password'),
                  validator: (val) => val!.length < 8 ? 'Password must be 8+ chars long' : null,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(height: 8.0),
            
                // Input confirm Password
                TextFormField(
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(labelText: 'Confirm Password'),
                  validator: (val) => val != password ? 'Enter a same password' : null,
                  onChanged: (val) {
                    setState(() {
                      confirmPassword = val;
                    });
                  },
                ),
                SizedBox(height: 8.0),
            
                // Input Adress
                TextFormField(
                  decoration: textInputDecoration.copyWith(labelText: 'Address'),
                  validator: (val) => val!.isEmpty ? 'Enter Address' : null,
                  onChanged: (val) {
                    setState(() {
                      address = val;
                    });
                  },
                ),
                SizedBox(height: 8.0),
            
                // Tombol Sign up
                ElevatedButton(
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(fullName,userName,noHp, email, password, address);
                      if (result == null){
                        setState(() {
                          loading = false;
                        });
                        
                      }
                    }
                  
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(380, 30.0), // Sesuaikan lebar dan tinggi sesuai kebutuhan
                    ),
                    shadowColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.all(Colors.green),
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 99, 157, 100)),
                    surfaceTintColor: MaterialStateProperty.all(Colors.white)
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                // Teks Daftar
                GestureDetector(
                  onTap: () {
                    widget.toggleView();
                  },
                  child: Text(
                    'Sudah memiliki akun? Login disini',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),
                ),
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}