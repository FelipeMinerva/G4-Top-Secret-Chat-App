import 'package:flutter/material.dart';
import 'package:mercury/providers/messages_provider.dart';
import 'package:provider/provider.dart';

import './chat_message.dart';

class ChatPanel extends StatelessWidget {
  final int _groupId;
  final _scrollController = ScrollController()  ;

  ChatPanel(this._groupId);

  @override
  Widget build(BuildContext context) {
    final messagesProvider = Provider.of<MessagesProvider>(context);
    // _scrollController.animateTo(_scrollController.position.maxScrollExtent,
    //     duration: const Duration(milliseconds: 500), curve: Curves.easeOut);

    return Container(
      color: Colors.white38,
      padding: EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          Scrollbar(
            child: Align(
              alignment: Alignment.topLeft,
              child: ListView(
                controller: _scrollController,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ...messagesProvider.messages
                      .where((message) => message.groupId == _groupId)
                      .map((e) => Container(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          color: messagesProvider.messages.indexOf(e) % 2 == 0
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
