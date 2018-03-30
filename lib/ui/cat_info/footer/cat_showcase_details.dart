import 'package:flutter/material.dart';

class DetailsShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return new Center(
      child: new Text(
          'Details: TODO',
          style: textTheme.title.copyWith(color: Colors.white),
      ),
    );
  }
}
