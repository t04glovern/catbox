import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CatBase {
  FirebaseUser user;
  String token;

  Future<Null> authUserWithEMail(String email, String password) async {
    this.user = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);

    this.token = await user.getIdToken();
  }

  getAllCats() async {
    final documentList = await Firestore.instance.collection('cats').getDocuments();
    return documentList.documents.map((cat) => cat.data);
  }
}
