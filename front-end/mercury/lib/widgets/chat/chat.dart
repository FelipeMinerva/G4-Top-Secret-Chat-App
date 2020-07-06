import 'package:flutter/material.dart';
import 'package:mercury/providers/messages_provider.dart';
import 'package:mercury/widgets/chat/chat_input.dart';
import 'package:provider/provider.dart';

import 'chat_panel.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MessagesProvider(),
        )
      ],
      child: Container(
        width: double.infinity,
        child: Scaffold(
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
