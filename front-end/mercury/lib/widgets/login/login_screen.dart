import 'package:flutter/material.dart';
import 'package:mercury/models/message_view_model.dart';
import 'package:mercury/models/user_view_model.dart';
import 'package:mercury/providers/messages_provider.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/services/chat_service.dart';
import 'package:mercury/services/login_service.dart';
import 'package:mercury/widgets/groups/groups_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/login';
  final _userNameController = TextEditingController();
  final _userEmailController = TextEditingController();
  final _userTagController = TextEditingController();

  Future<void> _login(
    BuildContext context,
  ) async {
    final _userState = Provider.of<UserProvider>(context, listen: false);
    final _userId = await LoginService().requestLogin(_userNameController.text,
        _userEmailController.text, _userTagController.text);

    _userState.user = UserViewModel(
        userId: _userId,
        name: _userNameController.text,
        email: _userEmailController.text,
        userTag: _userTagController.text);

    _navigateToGroupsScreen(context);
  }

  void _navigateToGroupsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(GroupsScreen.route);
  }

  void _getMessages(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final messagesProvider =
        Provider.of<MessagesProvider>(context, listen: false);

    var messages = ChatService().requestMessages(userProvider.user.userId);

    messagesProvider.loadMessages(messages.map((reply) => MessageViewModel(
          userProvider.user,
          reply.message.text,
        )));
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
              TextField(
                controller: _userTagController,
                decoration: InputDecoration.collapsed(
                  border: InputBorder.none,
                  hintText: 'Enter your tag',
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
