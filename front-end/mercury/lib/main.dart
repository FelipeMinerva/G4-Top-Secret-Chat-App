import 'package:flutter/material.dart';
import 'package:mercury/widgets/login/login.dart';

import './widgets/chat/chat.dart';
import 'models/user.dart';

void main() => runApp(Mercury());

class Mercury extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MercuryState();
  }
}

class _MercuryState extends State<Mercury> {
  User _activeUser;

  void _login(String userName) {
    setState(() {
      _activeUser = User(userName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: _activeUser != null
              ? Row(
                  children: <Widget>[
                    Material(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 1.0),
                        child: IconButton(
                          icon: Icon(Icons.face),
                          onPressed: null,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.indigo,
                    ),
                    Text(_activeUser.name),
                  ],
                )
              : Text('Mercury'),
          backgroundColor: Colors.indigo,
        ),
        body: _activeUser == null ? Login(_login) : Chat(),
      ),
    );
  }
}
