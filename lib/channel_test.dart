import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChannelDemoState();
  }
}

class ChannelDemoState extends State<ChannelDemo> {
  static const channel = MethodChannel("samples.flutter.io/battery");

  var _batteryLevel = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Channel Test"),
      ),
      body: Center(
        child: Text(_batteryLevel),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.get_app),
        onPressed: _getBatteryLevel,
      ),
    );
  }

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await channel.invokeMethod("getBatteryLevel");
      batteryLevel = "Battery is $result %";
    } on PlatformException catch (e) {
      batteryLevel = "failed to get battery level: ${e.message}";
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}
