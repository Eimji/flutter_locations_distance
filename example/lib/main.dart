import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_locations_distance/flutter_locations_distance.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _distance = 0.0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    double distance;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      distance = await FlutterLocationsDistance().distanceBetween(48.8438543, -3.5232399, 48.8589507, 2.2770204);
    } on PlatformException {
      distance = -1.0;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _distance = distance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Flutter locations distance'),
        ),
        body: new Center(
          child: new Text('Distance between Perros-Guirec and Paris in meters:\n $_distance\n'),
        ),
      ),
    );
  }
}
