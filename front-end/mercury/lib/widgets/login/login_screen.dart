import 'package:flutter/material.dart';
import 'package:mercury/models/message_view_model.dart';
import 'package:mercury/models/user_view_model.dart';
import 'package:mercury/providers/messages_provider.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/services/login_service.dart';
import 'package:mercury/widgets/groups/groups_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/login';
  final _userEmailController = TextEditingController();
  final _userTagController = TextEditingController();

  Future<void> _login(
    BuildContext context,
  ) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final messageProvider =
        Provider.of<MessagesProvider>(context, listen: false);

    final userId = await LoginService()
        .requestLogin(_userEmailController.text, _userTagController.text);

    userProvider.user = UserViewModel(
        id: userId,
        email: _userEmailController.text,
        tag: _userTagController.text);

    _getMessages(
      user: userProvider.user,
      context: context,
      messagesProvider: messageProvider,
    );
    _navigateToGroupsScreen(context);
  }

  void _navigateToGroupsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(GroupsScreen.route);
  }

  void _getMessages({
    BuildContext context,
    MessagesProvider messagesProvider,
    UserViewModel user,
  }) {
    messagesProvider.sendMessage(2, MessageViewModel.asSubscriptionSeed(user));

    var messages = messagesProvider.service
        .requestMessages(messagesProvider.outputStream.stream);

    messagesProvider.loadMessages(messages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mercury'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * .6,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: _userTagController,
                autofocus: true,
                decoration: InputDecoration.collapsed(
                  border: InputBorder.none,
                  hintText: 'Enter your tag',
                ),
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
                onPressed: () => _login(context),
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
