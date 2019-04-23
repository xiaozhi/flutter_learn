import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BaseWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BaseWidgetState();
  }
}

class _BaseWidgetState extends State<BaseWidget> {
  var _textFiledController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    _textFiledController.addListener(() {
      print(_textFiledController.text);
    });

    _focusNode.addListener(() {
      print("focus change");
    });

    return Scaffold(
        appBar: AppBar(title: Text("基本widget")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
//        color: Colors.tealAccent,
          child: Column(
            children: <Widget>[
              Text(
                "hello world",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    height: 1.2,
                    background: new Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "中国平安：",
                    style: TextStyle(color: Colors.orange, fontSize: 20)),
                TextSpan(
                    text: "http://www.pingan.com.cn",
                    style: TextStyle(color: Colors.blue))
              ])),
              RaisedButton(
                child: Text("RaiseButton 带阴影漂浮的按钮"),
                onPressed: () => print("RaiseButton tap"),
              ),
              FlatButton(
                child: Text("FlatButton 扁平的按钮"),
                onPressed: () => print("RaiseButton tap"),
              ),
              OutlineButton(
                child: Text("Outline Button 带边框的按钮"),
                onPressed: () => print("OutlineButton tap"),
              ),
              IconButton(
                icon: Icon(Icons.access_time),
                onPressed: () => print("IconButton tap"),
              ),
              FlatButton(
                child: Text("自定义按钮的外观"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                color: Colors.blue,
                onPressed: () {
                  print("IconButton tap");
                  if (_focusNode.hasFocus) {
                    _focusNode.unfocus();
                  }
                },
              ),
              CupertinoButton(
                child: Text("iOS Button"),
                color: Colors.blue,
                onPressed: () => {print("iOS Style button tap")},
              ),
              Image.network(
                "http://p1.pstatp.com/large/pgc-image/16119547567249bbad7f94dd78d3d55d",
                width: 300,
                height: 200,
                fit: BoxFit.fitWidth,
              ),
              TextField(
                controller: _textFiledController,
                autofocus: false,
                maxLines: 1,
                maxLength: 20,
                enabled: true,
                maxLengthEnforced: false,
                focusNode: _focusNode,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "密码",
                    hintText: "password"),
              )
            ],
          ),
        ));
  }
}
