import 'package:flutter/material.dart';

import './chat_message.dart';
import '../../models/message.dart';

class ChatPanel extends StatelessWidget {
  final List<Message> _messages;

  ChatPanel(this._messages);

  @override
  Widget build(BuildContext context) {
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
                  ..._messages
                      .map((e) => Container(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          color: _messages.indexOf(e) % 2 == 0
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
