import 'dart:async';

import 'package:catbox/models/cat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// TODO: Pull out auth / make singleton.
class CatApi {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = new GoogleSignIn();

  FirebaseUser firebaseUser;

  CatApi(FirebaseUser user) {
    this.firebaseUser = user;
  }

  static Future<CatApi> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final FirebaseUser user = await _auth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return new CatApi(user);
  }

  // TODO: Find proper solution.
  List<String> _uglyTypeHack(List<dynamic> list) {
    List<String> stringList = [];
    list.forEach((e) => stringList.add(e.toString()));
    return stringList;
  }

  Cat _fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data;

    // TODO: Firestore field name changes:
    // TODO: id -> external_id, image_url -> avatar_url, adopted -> is_adopted.
    return new Cat(
        documentId: snapshot.documentID,
        externalId: data['id'],
        name: data['name'],
        description: data['description'],
        avatarUrl: data['image_url'],
        location: data['location'],
        likeCounter: data['like_counter'],
        isAdopted: data['adopted'],
        pictures: _uglyTypeHack(data['pictures']),
        cattributes: _uglyTypeHack(data['cattributes']));
  }

  Future likeCat(Cat cat) async {
    await Firestore.instance
        .collection('likes')
        .document('${cat.documentId}:${this.firebaseUser.uid}')
        .setData({});
  }

  Future unlikeCat(Cat cat) async {
    await Firestore.instance
        .collection('likes')
        .document('${cat.documentId}:${this.firebaseUser.uid}')
        .delete();
  }

  Future<bool> hasLikedCat(Cat cat) async {
    final like = await Firestore.instance
        .collection('likes')
        .document('${cat.documentId}:${this.firebaseUser.uid}')
        .get();

    return like.exists;
  }

  Future<List<Cat>> getAllCats() async {
    return (await Firestore.instance.collection('cats').getDocuments())
        .documents
        .map((snapshot) => _fromDocumentSnapshot(snapshot))
        .toList();
  }

  StreamSubscription watch(Cat cat, void onChange(Cat cat)) {
    return Firestore.instance
        .collection('cats')
        .document(cat.documentId)
        .snapshots
        .listen((snapshot) => onChange(_fromDocumentSnapshot(snapshot)));
  }
}
