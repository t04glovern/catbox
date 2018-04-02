import 'dart:async';
import 'package:catbox/ui/cats/cat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CatRepo {
  FirebaseUser user;
  String token;

  CatRepo._(this.user, this.token);

  static Future<CatRepo> fromEMailAuth(String email, String password) async {
    final user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    final token = await user.getIdToken();

    return new CatRepo._(user, token);
  }

  Future<List<Cat>> getAllCats() async {
    final documentList = await Firestore.instance.collection('cats').getDocuments();

    return documentList.documents.map((cat) {
      final data = cat.data;
      return new Cat(
          documentId: cat.documentID,
          catId: data['id'],
          name: data['name'],
          description: data['description'],
          avatar: data['image_url'],
          location: data['location'],
          stars: data['stars'],
          adopted: data['adopted'],
          pictures: data['pictures']?.toList(),
          cattributes: data['cattributes']?.toList());
    }).toList();
  }
}
