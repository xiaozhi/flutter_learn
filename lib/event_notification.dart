import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EventRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventState();
  }
}

class _EventState extends State<EventRoute> {
  var _event;
  String _gestureName;
  double _top = 0;
  double _left = 0;
  double _imageWidth = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scafflod Test"),
        ),
        body: Column(
          children: <Widget>[
            Listener(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                height: 100.0,
                child: Text(_event?.toString() ?? "",
                    style: TextStyle(color: Colors.white)),
              ),
              onPointerDown: (PointerDownEvent event) =>
                  setState(() => _event = event),
              onPointerMove: (PointerMoveEvent event) =>
                  setState(() => _event = event),
              onPointerUp: (PointerUpEvent event) =>
                  setState(() => _event = event),
            ),
            Listener(
              child: AbsorbPointer(
                child: Listener(
                  child: Container(
                    constraints: BoxConstraints(
                        minHeight: 50, minWidth: double.infinity),
//                    alignment: Alignment.centerRight,
                    color: Colors.orange,
                    height: 40,
                    child: Text("测试AbsorbPointer，请看控制台输出"),
                  ),
                  onPointerDown: (event) => print("in"),
                ),
              ),
              onPointerDown: (event) => print("out"),
            ),
            GestureDetector(
              onLongPress: () => updateGestureName("longPress"),
              onTap: () => updateGestureName("onTap"),
              onDoubleTap: () => updateGestureName("double tap"),
              child: Container(
                height: 40,
                alignment: Alignment.center,
                color: Colors.pinkAccent,
                child: Text("$_gestureName"),
              ),
            ),
            Container(
                height: 100,
                color: Colors.amber,
                child: GestureDetector(
                  onPanUpdate: (e) {
                    setState(() {
                      print(e);
                      _top += e.delta.dy;
                      _left += e.delta.dx;
                    });
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Positioned(
                          left: _left,
                          top: _top,
//                          child: GestureDetector(
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text("A"),
                            ),)
//                          ))
                    ],
                  ),
                )
            ),
            Container(
              color: Colors.blue,
              alignment: Alignment.center,
              height: 200,
              child: GestureDetector(
                child: Image.asset("image/th.jpeg",width: _imageWidth),
                onScaleUpdate: (detail) {
                  print("aa");
                  setState(() {
                    print("upgrade ${detail.scale}");
                    _imageWidth = 200 * detail .scale.clamp(.8, 10.0);
                  });
                },
                onScaleEnd: (detail){
                  print("end $detail");
                },
              ),
            )
          ],
        ));
  }

  void updateGestureName(String name) {
    setState(() {
      _gestureName = name;
    });
  }
}
