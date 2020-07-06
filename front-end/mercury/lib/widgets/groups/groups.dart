import 'package:flutter/material.dart';

class Groups extends StatefulWidget {
  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[Text('Picles')],
            )
          ],
        ),
      ),
    );
  }
}
