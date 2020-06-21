import 'package:flutter/material.dart';
import 'package:mercury/widgets/login/login.dart';

import './widgets/chat/chat.dart';
import 'models/user.dart';
import 'services/login_service.dart';

void main() => runApp(Mercury());

class Mercury extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MercuryState();
  }
}

class _MercuryState extends State<Mercury> {
  User _activeUser;

  Future<void> _login(String userName, String userEmail) async {
    var request = await LoginService().requestLogin(userName, userEmail);

    setState(() {
      _activeUser = User.withEmail(userName, userEmail);
      _activeUser.userId = request;
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
                    Text(_activeUser.name + (_activeUser.userId ?? '').toString()),
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
