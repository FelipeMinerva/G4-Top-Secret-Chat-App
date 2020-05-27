import 'package:flutter/material.dart';

import './chat/chat.dart';

void main() => runApp(Mercury());

class Mercury extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MercuryState();
  }
}

class _MercuryState extends State<Mercury> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mercury"),
        ),
        body: Chat(),
      ),
    );
  }
}
