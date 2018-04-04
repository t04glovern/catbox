import 'package:flutter/material.dart';
import 'package:catbox/services/cat_api.dart';
import 'package:catbox/utils/cat_routes.dart';
import 'package:catbox/ui/cat_info/cat_info_page.dart';
import 'package:catbox/models/cat.dart';

class CatsPage extends StatefulWidget {
  @override
  _CatsPageState createState() => new _CatsPageState();
}

class _CatsPageState extends State<CatsPage> {
  List<Cat> _cats = [];

  //TODO Use the info in this for something visual
  CatApi _api;
  NetworkImage _profileImage;

  @override
  void initState() {
    super.initState();
    _loadCats();
    _loadProfileImage();
  }

  _loadProfileImage() async {
    final _api = await CatApi.signInWithGoogle();
    setState(() {
      _profileImage = new NetworkImage(_api.firebaseUser.photoUrl);
    });
  }

  _loadCats() async {
    final api = await CatApi.signInWithGoogle();
    final cats = await api.getAllCats();
    setState(() {
      _api = api;
      _cats = cats;
    });
  }

  _buildCatItem(BuildContext context, int index) {
    Cat cat = _cats[index];

    return new Container(
      margin: const EdgeInsets.only(top: 5.0),
      child: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new ListTile(
              onTap: () => _navigateToCatDetails(cat, index),
              leading: new Hero(
                tag: index,
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(cat.avatar),
                ),
              ),
              title: new Text(cat.name),
              subtitle: new Text(cat.description),
              isThreeLine: true,
            ),
          ],
        ),
      ),
    );
  }

  _navigateToCatDetails(Cat cat, Object avatarTag) {
    Navigator.of(context).push(
          new FadePageRoute(
            builder: (c) {
              return new CatDetailsPage(cat, avatarTag: avatarTag);
            },
            settings: new RouteSettings(),
          ),
        );
  }

  Widget _getAppTitleWidget() {
    return new Text(
      'Cats',
      style: new TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
    );
  }

  Widget _buildBody() {
    return new Container(
      // A top margin of 56.0. A left and right margin of 8.0. And a bottom margin of 0.0.
      margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
      child: new Column(
        // A column widget can have several widgets that are placed in a top down fashion
        children: <Widget>[_getAppTitleWidget(), _getListViewWidget()],
      ),
    );
  }

  Widget _getListViewWidget() {
    return new Flexible(
        child: new ListView.builder(
            itemCount: _cats.length, itemBuilder: _buildCatItem));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: _buildBody(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          // Do something when FAB is pressed
        },
        backgroundColor: Colors.blue,
        child: new CircleAvatar(
          backgroundImage: _profileImage,
          radius: 50.0,
        ),
      ),
    );
  }
}
