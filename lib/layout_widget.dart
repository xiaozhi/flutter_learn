import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlexWidgetState();
  }
}

class _FlexWidgetState extends State<FlexWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Flex layoiut(弹性布局)")),
        body: Column(

          children: <Widget>[
            Container(height: 20),

            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 30,
                    color: Colors.yellow,
                  ),
                )
              ],
            ),

            Container(height: 20),

            SizedBox(
              height: 200,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.green,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 30,
                      color: Colors.yellow,
                    ),
                  )
                ],
              ),
            )

          ],
        )
    );
  }
}

class WrapLayoutWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WrapLayoutState();
  }
}

class _WrapLayoutState extends State<WrapLayoutWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("WrapLayout")),
        body: Wrap(
          alignment: WrapAlignment.center,
          spacing: 20,  //横轴方向间距
          runSpacing: 10, //纵轴方向的间距
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("T")),
              label: Text("Text"),
            ),
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("T")),
              label: Text("Text"),
            ),
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("T")),
              label: Text("Text"),
            ),
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("T")),
              label: Text("Text"),
            ),
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("T")),
              label: Text("Text"),
            ),
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("T")),
              label: Text("Text"),
            ),
            Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("T")),
              label: Text("Text"),
            )
          ],
        )
    );
  }
}

class FlowLayoutRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FlowLayoutState();
  }
}

class _FlowLayoutState extends State<FlowLayoutRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Flow Layout")),
        body: Flow(
          delegate: _TestFlowDelegate(),
          children: <Widget>[
            new Container(width: 80, height: 80, color: Colors.green),
            new Container(width: 80, height: 80, color: Colors.red),
            new Container(width: 80, height: 80, color: Colors.amber),
            new Container(width: 80, height: 80, color: Colors.pinkAccent),
            new Container(width: 80, height: 80, color: Colors.orange),
            new Container(width: 80, height: 80, color: Colors.purple),
            new Container(width: 80, height: 80, color: Colors.blue),
            new Container(width: 80, height: 80, color: Colors.brown),
            new Container(width: 80, height: 80, color: Colors.tealAccent),
          ],
        )
    );
  }
}

class _TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.all(10);
  
  @override
  void paintChildren(FlowPaintingContext context) {
    // TODO: implement paintChildren
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return null;
  }

}
