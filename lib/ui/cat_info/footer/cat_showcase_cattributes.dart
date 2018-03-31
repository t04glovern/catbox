import 'package:flutter/material.dart';
import 'package:catbox/ui/cats/cat.dart';

class CattributesShowcase extends StatelessWidget {
  CattributesShowcase(this.cat);

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Center(
      child: new Text(
        'Cattributes: TODO',
        style: textTheme.subhead.copyWith(color: Colors.white),
      ),
    );
  }
}
