import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bank_sampah/models/myuser.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference profileCollection = FirebaseFirestore.instance.collection('profile');

  Future updateUserData({String? fullName, String?userName, String? noHp, String? email, String? address}) async {

    Map<String, dynamic> dataToUpdate = {
    if (email != null) 'email': email,
    if (fullName != null) 'fullName': fullName,
    if (userName != null) 'userName': userName,
    if (noHp != null) 'noHp': noHp,
    if (address != null) 'address': address,
  };

  return profileCollection.doc(uid).update(dataToUpdate);

  }

  //User data from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      fullName: snapshot.get('fullName'),
      userName: snapshot.get('userName'),
      email: snapshot.get('email'),
      noHp: snapshot.get('noHp'),
      address: snapshot.get('address')
    );
  }

  //get user doc stream
  Stream<UserData> get userData{
    return profileCollection.doc(uid).snapshots()
    .map(_userDataFromSnapshot);
  }



}