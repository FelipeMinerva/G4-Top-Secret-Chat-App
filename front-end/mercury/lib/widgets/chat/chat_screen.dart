import 'package:flutter/material.dart';
import 'package:mercury/providers/messages_provider.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/widgets/chat/chat_input.dart';
import 'package:provider/provider.dart';

import 'chat_panel.dart';

class ChatScreen extends StatefulWidget {
  static String route = '/chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserProvider>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MessagesProvider(),
        )
      ],
      child: Container(
        width: double.infinity,
        child: Scaffold(
          appBar: AppBar(
            title: Text(userState.user.name),
            backgroundColor: Colors.indigo,
          ),
          body: Column(
            children: <Widget>[
              Expanded(child: ChatPanel()),
              ChatInput(_focusNode),
            ],
          ),
        ),
      ),
    );
  }
}
