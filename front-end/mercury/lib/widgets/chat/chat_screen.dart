import 'package:flutter/material.dart';
import 'package:mercury/models/group_view_model.dart';
import 'package:mercury/widgets/chat/chat_input.dart';

import 'chat_panel.dart';

class ChatScreen extends StatefulWidget {
  static const String route = '/chat';
  final GroupViewModel _group;

  ChatScreen(this._group);

  @override
  _ChatScreenState createState() => _ChatScreenState(this._group);
}

class _ChatScreenState extends State<ChatScreen> {
  FocusNode _focusNode;
  final GroupViewModel _group;

  _ChatScreenState(this._group);

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
    return Container(
      width: double.infinity,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_group.groupName),
          backgroundColor: Colors.indigo,
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: ChatPanel(_group.groupId)),
            ChatInput(_focusNode, _group.groupId),
          ],
        ),
      ),
    );
  }
}
