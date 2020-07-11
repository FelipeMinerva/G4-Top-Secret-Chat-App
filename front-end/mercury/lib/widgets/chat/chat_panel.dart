import 'package:flutter/material.dart';
import 'package:mercury/providers/messages_provider.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/services/chat_service.dart';
import 'package:provider/provider.dart';
import 'package:mercury/models/message_view_model.dart' as models;

import './chat_message.dart';

class ChatPanel extends StatelessWidget {

  void _getMessages(BuildContext context, MessagesProvider messagesState) {
    final userState = Provider.of<UserProvider>(context, listen: false);

    var messages = ChatService().requestMessages(userState.user.userId);

    messagesState.loadMessages(messages
        .map((reply) => models.MessageViewModel(userState.user, reply.message.text)));
  }

  @override
  Widget build(BuildContext context) {
    final _messagesState =
        Provider.of<MessagesProvider>(context, listen: false);
    _getMessages(context, _messagesState);

    return Container(
      color: Colors.white38,
      padding: EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          Scrollbar(
            child: Align(
              alignment: Alignment.topLeft,
              child: ListView(
                shrinkWrap: true,
                reverse: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ..._messagesState.messages
                      .map((e) => Container(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          color: _messagesState.messages.indexOf(e) % 2 == 0
                              ? Colors.indigo[50]
                              : Colors.white10,
                          child: (ChatMessage(e))))
                      .toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
