import 'package:flutter/material.dart';
import 'package:catbox/ui/cat_info/footer/cat_showcase_cattributes.dart';
import 'package:catbox/ui/cat_info/footer/cat_showcase_pictures.dart';
import 'package:catbox/ui/cat_info/footer/cat_showcase_details.dart';
import 'package:catbox/ui/cats/cat.dart';

class CatShowcase extends StatefulWidget {
  CatShowcase(this.cat);

  final Cat cat;

  @override
  _CatShowcaseState createState() => new _CatShowcaseState();
}

class _CatShowcaseState extends State<CatShowcase>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  initState() {
    super.initState();
    _tabs = [
      new Tab(text: 'Pictures'),
      new Tab(text: 'Details'),
      new Tab(text: 'Cattributes'),
    ];
    _pages = [
      new PicturesShowcase(),
      new DetailsShowcase(),
      new CattributesShowcase(),
    ];
    _controller = new TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: [
          new TabBar(
            controller: _controller,
            tabs: _tabs,
            indicatorColor: Colors.white,
          ),
          new SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: new TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}
