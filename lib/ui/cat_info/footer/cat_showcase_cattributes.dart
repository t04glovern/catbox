import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:catbox/ui/cats/cat.dart';

class CattributesShowcase extends StatelessWidget {
  CattributesShowcase(this.cat);

  final Cat cat;

  _createCircleBadge(IconData iconData, Color bgColor, Color iconColor, String text) {
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
            child: new Text(text,
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

    var delegate = new SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    );

    return new GridView(
      padding: const EdgeInsets.only(top: 16.0),
      gridDelegate: delegate,
      children: [
        _createCircleBadge(
            FontAwesomeIcons.child,
            Colors.white12,
            Colors.white,
            'Kid Friendly'
        ),
        _createCircleBadge(
            FontAwesomeIcons.cut,
            Colors.white12,
            Colors.white,
            'Desexed'
        ),
        _createCircleBadge(
            FontAwesomeIcons.eyeDropper,
            Colors.white12,
            Colors.white,
            'Vaccinated'
        ),
        _createCircleBadge(
            FontAwesomeIcons.microchip,
            Colors.white12,
            Colors.white,
            'Microchipped'
        ),
        _createCircleBadge(
            FontAwesomeIcons.fighterJet,
            Colors.white12,
            Colors.white,
            'Speedy'
        ),
      ],
    );
  }
}
