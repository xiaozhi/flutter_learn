import 'package:flutter/material.dart';
import 'package:flutter_practice/base_widget.dart';
import 'layout_widget.dart';

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
        "base_widget": (context)=> BaseWidget(),
        "layout_widget": (context)=> FlexWidget(),
        "wrap_widget": (context) => WrapLayoutWidget()
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

  List<String> items = [
    "基础Widgets",
    "Flex布局",
    "流式布局(Wrap)"
  ];
  List<String> routeName = [
    "base_widget",
    "layout_widget",
    "wrap_widget"
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text(items[index]),
                onTap: (){
                  Navigator.of(context).pushNamed(routeName[index]);
                },
              );
          },
          separatorBuilder: (BuildContext context, int index){
              return Divider(color: Colors.blue);
          },
          itemCount: items.length)
    );
  }


  Widget _buildRow(int index){
    
  } 
}
