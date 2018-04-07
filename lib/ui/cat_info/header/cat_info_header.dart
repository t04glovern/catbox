import 'package:catbox/models/cat.dart';
import 'package:catbox/services/cat_api.dart';
import 'package:catbox/ui/cat_info/header/cat_cut_colored_image.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CatDetailHeader extends StatelessWidget {
  static const BACKGROUND_IMAGE = 'images/profile_header_background.png';

  CatDetailHeader(
    this.cat, {
    @required this.avatarTag,
  });

  final Cat cat;
  final Object avatarTag;
  
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
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
                cat.stars.toString(),
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
          new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new MaterialButton(
              minWidth: 140.0,
              color: theme.accentColor,
              textColor: Colors.white,
              onPressed: () async {
                //
              },
              //TODO Launch adoption information page
              child: new Text('ADOPT ME'),
            ),
          ),
          new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new MaterialButton(
              minWidth: 140.0,
              color: Colors.lightGreen,
              textColor: Colors.white,
              onPressed: () async {
                // TODO: Create proper singleton.
                final api = await CatApi.signInWithGoogle();
                api.likeCat(this.cat.documentId);

                // TODO: Bind as state.
                this.cat.stars += 1;
              },
              //TODO Launch adoption information page
              child: new Text('STAR'),
            ),
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
