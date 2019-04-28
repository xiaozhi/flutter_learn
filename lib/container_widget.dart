import 'package:flutter/material.dart';

class ScaffoldTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScafflodTestState();
  }
}

class _ScafflodTestState extends State<ScaffoldTest>
    with SingleTickerProviderStateMixin {
  var tabname = ["news", "history", "image"];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabname.length, vsync: this);
    _tabController.addListener(() {
          switch (_tabController.index) {
            case 1:
            case 2:
              break;
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scafflod Test"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.share,
            ),
            onPressed: () {},
          )
        ],
         bottom: TabBar(
           controller: _tabController,
             tabs: tabname.map((s) {
                  return Tab(text: s);
             }).toList(),
         ),
      ),
      drawer: new _MyDrawer(),
    body: GestureDetector(

    ),
//       endDrawer: new Drawer(), 右边抽
    );
  }
}

class _MyDrawer extends Drawer {
  @override
  Widget build(BuildContext context) {
    var widget = super.build(context);
    return widget;
  }
}


class EventBus {

  static EventBus _singleton = EventBus._internal();

  factory EventBus() => _singleton;

  // 定义
  EventBus._internal();
}


