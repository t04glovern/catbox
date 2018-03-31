import 'dart:async';

import 'package:flutter/material.dart';
import 'package:catbox/ui/cats/cat_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void doshit() async {
//  /*
//  final FirebaseOptions options = const FirebaseOptions(
//    googleAppID: '1:812887303310:android:812371ef5b88633a',
//    apiKey: "AIzaSyAEN-md50zSlX2UIBLVVOiz572WII-bO_0",
//  );
//
//  final FirebaseApp app = await FirebaseApp.configure(
//    name: 'catbox',
//    options: options,
//  );
//  */
//
//  final FirebaseOptions options = const FirebaseOptions(
//    googleAppID: '1:812887303310:android:812371ef5b88633a',
//    apiKey: "AIzaSyAEN-md50zSlX2UIBLVVOiz572WII-bO_0",
//  );
//
//  Future<Null> _allApps() async {
//    final List<FirebaseApp> apps = await FirebaseApp.allApps();
//    print('Currently configured apps: $apps');
//    print('');
//
//    /*
//    Firestore.instance
//    final doc = await Firestore.instance.collection('cats').document('MUMNgOJRyb15XSvef4gn').get();
//    */
//  }
//
//  Future<Null> _configure() async {
//    final FirebaseApp app = await FirebaseApp.configure(
//      name: 'catbox',
//      options: options,
//    );
//    assert(app != null);
//    print('Configured $app');
//
//
////    _allApps();
//
////    FirebaseApp.initializeApp(Context)
////    final store = app
////    final doc = await app. Firestore.instance.collection('cats').document('MUMNgOJRyb15XSvef4gn').get();
//  }


//  _configure();

  final doc = await Firestore.instance.collection('cats').document('MUMNgOJRyb15XSvef4gn').get();
  print(doc);
}

void main() {
  doshit();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pinkAccent
      ),
      home: new CatsPage(),
    );
  }
}
