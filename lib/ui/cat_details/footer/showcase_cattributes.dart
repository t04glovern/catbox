import 'package:catbox/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final dynamic cattributeLookup = {
  "children": {"name": "Kid Friendly", "icon": FontAwesomeIcons.child},
  "desexed": {"name": "Desexed", "icon": FontAwesomeIcons.cut},
  "vaccinated": {"name": "Vaccinated", "icon": FontAwesomeIcons.eyeDropper},
  "microchipped": {"name": "Microchipped", "icon": FontAwesomeIcons.microchip},
};

class CattributesShowcase extends StatelessWidget {
  final Cat cat;

  CattributesShowcase(this.cat);

  _createCircleBadge(
    IconData iconData, Color bgColor, Color iconColor, String text) {
      return new Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: new Stack(
          children: <Widget>[
            new CircleAvatar(
              backgroundColor: bgColor,
              child: new Icon(
                iconData,
                color: iconColor,
                size: 36.0,
              ),
              radius: 36.0,
            ),
            new Positioned(
              child: new Text(
                text,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.0,
                  color: iconColor,
                ),
              ),
            ),
          ],
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    var items = <Widget>[];

    for (var i = 0; i < cat.cattributes.length; i++) {
      var badge = _createCircleBadge(
        cattributeLookup[cat.cattributes[i]]['icon'],
        Colors.white12,
        Colors.white,
        cattributeLookup[cat.cattributes[i]]['name'],
      );

      items.add(badge);
    }

    var delegate = new SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    );

    return new GridView(
      padding: const EdgeInsets.only(top: 16.0),
      gridDelegate: delegate,
      children: items
    );
  }
}
