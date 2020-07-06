import 'package:flutter/material.dart';
import 'package:mercury/models/user.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/services/login_service.dart';
import 'package:mercury/widgets/chat/chat.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final _userNameController = TextEditingController();
  final _userEmailController = TextEditingController();

  Future<void> _login({
    String userName,
    String userEmail,
    BuildContext context,
  }) async {
    final _userState = Provider.of<UserProvider>(context, listen: false);
    final _userId = await LoginService().requestLogin(userName, userEmail);

    _userState.user = User(
      name: _userNameController.text,
      userId: _userId,
      email: _userEmailController.text,
    );

    _navigateFoward(context);
  }

  void _navigateFoward(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => Chat(),
      fullscreenDialog: true,
    ));
  }

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
                controller: _userNameController,
                decoration: InputDecoration.collapsed(
                  border: InputBorder.none,
                  hintText: 'Enter your name',
                ),
                autofocus: true,
              ),
              TextField(
                controller: _userEmailController,
                decoration: InputDecoration.collapsed(
                  border: InputBorder.none,
                  hintText: 'Enter your email',
                ),
              ),
              RaisedButton(
                child: Text('Sign in'),
                onPressed: () => _login(
                    userName: _userNameController.text,
                    userEmail: _userEmailController.text,
                    context: context),
                color: Colors.indigo,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
