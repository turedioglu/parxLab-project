

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//Giriş Yapma İşlemi
  /* Future<User> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  } */

  //Kayıt Olma İşlemi
  /* Future<User> createPerson(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection("Kullanici")
        .doc(user.user.uid)
        .set({'userName': name, 'email': email});

    return user.user;
  } */

 //Çıkış Yapma İşlemi
  signOut() async {
    return await _auth.signOut();
  }

}
