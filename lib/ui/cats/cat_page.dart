import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:catbox/ui/cat_info/cat_info_page.dart';
import 'package:catbox/ui/cats/cat.dart';

class CatsPage extends StatefulWidget {
  @override
  _CatsPageState createState() => new _CatsPageState();
}

class _CatsPageState extends State<CatsPage> {
  List<Cat> _cats = [];

  @override
  void initState() {
    super.initState();
    _loadCats();
  }

  _loadCats() async {
    String response =
        await createHttpClient().read('https://randomuser.me/api/?results=25');

    setState(() {
      _cats = Cat.allFromResponse(response);
    });
  }

  _buildFriendItem(BuildContext context, int index) {
    Cat cat = _cats[index];

    return new ListTile(
      onTap: () => _navigateToFriendDetails(cat, index),
      leading: new Hero(
        tag: index,
        child: new CircleAvatar(
          backgroundImage: new NetworkImage(cat.avatar),
        ),
      ),
      title: new Text(cat.name),
      subtitle: new Text(cat.email),
    );
  }

  _navigateToFriendDetails(Cat cat, Object avatarTag) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (c) {
          return new CatDetailsPage(cat, avatarTag: avatarTag);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var content;

    if (_cats.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        itemCount: _cats.length,
        itemBuilder: _buildFriendItem,
      );
    }

    return new Scaffold(
      appBar: new AppBar(title: new Text('Cats')),
      body: content,
    );
  }
}
