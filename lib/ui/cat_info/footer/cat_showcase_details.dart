import 'package:flutter/material.dart';
import 'package:catbox/ui/cats/cat.dart';

class DetailsShowcase extends StatelessWidget {
  DetailsShowcase(this.cat);

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Center(
      child: new Text(
          cat.description,
          textAlign: TextAlign.center,
          style: textTheme.subhead.copyWith(color: Colors.white),
      ),
    );
  }
}
