import 'package:flutter/material.dart';

class ScaffoldTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScafflodTestState();
  }
}

class _ScafflodTestState extends State<ScaffoldTest> with SingleTickerProviderStateMixin{

  var tabname = ["news", "history", "image"];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabname.length, vsync: this);
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
             onPressed: (){},
           )
         ],
//         bottom: TabBar(
//           controller: ,
//             tabs: tabname.map((s) {
//                  Tab(text: s);
//             }).toList(),
//         ),
       ),
       drawer: new _MyDrawer(),
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



