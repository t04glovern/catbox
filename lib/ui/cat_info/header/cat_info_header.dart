import 'package:flutter/material.dart';
import 'package:catbox/ui/cat_info/header/cat_cut_colored_image.dart';
import 'package:catbox/ui/cats/cat.dart';
import 'package:meta/meta.dart';

class CatDetailHeader extends StatelessWidget {
  static const BACKGROUND_IMAGE = 'images/profile_header_background.png';

  CatDetailHeader(
    this.cat, {
    @required this.avatarTag,
  });

  final Cat cat;
  final Object avatarTag;

  _createPillButton(
    String text, {
    Color backgroundColor = Colors.transparent,
    Color textColor = Colors.white70,
  }) {
    return new ClipRRect(
      borderRadius: new BorderRadius.circular(30.0),
      child: new MaterialButton(
        minWidth: 140.0,
        color: backgroundColor,
        textColor: textColor,
        onPressed: () {}, //TODO Launch adoption information page
        child: new Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var followerStyle =
        textTheme.subhead.copyWith(color: const Color(0xBBFFFFFF));
    var screenWidth = MediaQuery.of(context).size.width;

    var diagonalBackground = new DiagonallyCutColoredImage(
      new Image.asset(
        BACKGROUND_IMAGE,
        width: screenWidth,
        height: 280.0,
        fit: BoxFit.cover,
      ),
      color: const Color(0xBB42A5F5),
    );

    var avatar = new Hero(
      tag: avatarTag,
      child: new CircleAvatar(
        backgroundImage: new NetworkImage(cat.avatar),
        radius: 75.0,
      ),
    );

    var followerInfo = new Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(
            Icons.star,
            color: Colors.white,
            size: 16.0,
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(
              cat.stars,
              style: textTheme.subhead.copyWith(color: Colors.white),
          ))
        ],
      ),
    );

    var actionButtons = new Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _createPillButton(
            'ADOPT ME',
            backgroundColor: theme.accentColor,
            textColor: Colors.white,
          ),
          _createPillButton(
            'STAR',
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
          ),
        ],
      ),
    );

    return new Stack(
      children: [
        diagonalBackground,
        new Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.4,
          child: new Column(
            children: [
              avatar,
              followerInfo,
              actionButtons,
            ],
          ),
        ),
        new Positioned(
          top: 26.0,
          left: 4.0,
          child: new BackButton(color: Colors.white),
        ),
      ],
    );
  }
}
