import 'package:bank_sampah/services/auth.dart';
import 'package:bank_sampah/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:bank_sampah/shared/constans.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool _hidePass = true;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Gambar Logo
              Container(
                width: 450.0,
                height: 130.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bank_sampah_logo.jpeg'), // Gantilah dengan path gambar logo Anda
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
          
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
              SizedBox(height: 10.0),
          
              // Input Password
              TextFormField(
                obscureText: _hidePass,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      setState(() => _hidePass = !_hidePass);
                    },
                  ),
                ),
                validator: (val) => val!.isEmpty ? 'Enter Password' : null,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 10.0),
          
              // Tombol Sign In
              ElevatedButton(
                onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    setState(() => loading = true,);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        loading = false;
                        error = 'couldnot match your username or password';
                      });
                      
                    }

                  }
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size(400, 50.0), // Sesuaikan lebar dan tinggi sesuai kebutuhan
                  ),
                  shadowColor: MaterialStateProperty.all(Colors.white),
                  overlayColor: MaterialStateProperty.all(Colors.green),
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 99, 157, 100)),
                  surfaceTintColor: MaterialStateProperty.all(Colors.white)
                ),
                child: Text(
                  'Sign In',
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
                  'Belum memiliki akun? Daftar disini',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 5.0,),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                ),
              )
          
          
            ],
          ),
        ),
      ),
    );
  }
}