import 'package:flutter/material.dart';
import 'package:flutter_practice/base_widget.dart';
import 'layout_widget.dart';
import 'container_widget.dart';
import 'channel_test.dart';
import 'event_notification.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "base_widget": (context) => BaseWidget(),
        "layout_widget": (context) => FlexWidget(),
        "wrap_widget": (context) => WrapLayoutWidget(),
        "scaffold_widget": (context) => ScaffoldTest(),
        "channel_test" : (context) => ChannelDemo(),
        "event_route" : (context) => EventRoute()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> items = ["基础Widgets", "Flex布局", "流式布局(Wrap)", "scaffold_widget", "通道测试", "事件"];
  List<String> routeName = [
    "base_widget",
    "layout_widget",
    "wrap_widget",
    "scaffold_widget",
    "channel_test",
    "event_route"
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(items[index]),
                onTap: () {
                  Navigator.of(context).pushNamed(routeName[index]);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(color: Colors.blue);
            },
            itemCount: items.length
        )
    );
  }
}
