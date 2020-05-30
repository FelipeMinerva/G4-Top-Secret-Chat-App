import 'package:flutter/material.dart';
import 'package:mercury/widgets/chat/chat_input.dart';

import 'chat_panel.dart';
import '../../models/message.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var _messages = List<Message>();
  FocusNode _focusNode;

  void _addNewMessage(Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(child: ChatPanel(_messages)),
            ChatInput(_addNewMessage, _focusNode),
          ],
        ),
      ),
    );
  }
}
