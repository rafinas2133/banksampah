import 'package:bank_sampah/models/myuser.dart';
import 'package:bank_sampah/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUsers? _userFromFireBase(User? user){
    return user != null ? MyUsers(uid: user.uid) : null;
  }

  // auth change user stream

  Stream<MyUsers?> get user {
    return _auth.authStateChanges().map(_userFromFireBase);
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFireBase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }

  }

  // sign in email and pass
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFireBase(user);
    } catch (e) {
      print(e.toString());
      return null;      
    }
  }

  // register 
  Future registerWithEmailAndPassword(String? fullName, String?userName, String? noHp, String email, String password, String? address) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //create a new doc for the user
      await DatabaseService(uid: user!.uid).updateUserData(
        fullName: fullName, 
        userName: userName, 
        noHp: noHp, 
        email: email, 
        address: address
        );
      return _userFromFireBase(user);
    } catch (e) {
      print(e.toString());
      return null;      
    }
  }

  // log out
  Future signOut() async {

    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}