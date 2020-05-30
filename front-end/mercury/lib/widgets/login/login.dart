import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Function _login;
  final loginController = TextEditingController();

  Login(this._login);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .6,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: loginController,
                decoration: InputDecoration.collapsed(
                  border: InputBorder.none,
                  hintText: 'Enter your name',
                ),
                autofocus: true,
                onSubmitted: (text) => _login(text),
              ),
              RaisedButton(
                child: Text('Sign in'),
                onPressed: () => _login(loginController.text),
                color: Colors.indigo,
                textColor: Colors.white,
              ),
              // Material(
              //   child: Container(
              //     margin: EdgeInsets.symmetric(horizontal: 1.0),
              //     child: IconButton(
              //       icon: Icon(Icons.arrow_forward),
              //       onPressed: null,
              //       color: Colors.indigo,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
