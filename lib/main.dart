import 'package:flutter/material.dart';
import 'package:catbox/ui/cats/cat_page.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue, accentColor: Colors.pinkAccent),
      home: new CatsPage(),
    );
  }
}
