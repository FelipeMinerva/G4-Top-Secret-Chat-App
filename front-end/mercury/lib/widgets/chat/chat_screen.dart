import 'package:flutter/material.dart';
import 'package:mercury/models/group_view_model.dart';
import 'package:mercury/providers/messages_provider.dart';
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
    final GroupViewModel group = ModalRoute.of(context).settings.arguments;

    return Container(
      width: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          title: Text(group.groupName),
          backgroundColor: Colors.indigo,
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: ChatPanel(group.groupId)),
            ChatInput(_focusNode, group.groupId),
          ],
        ),
      ),
    );
  }
}
