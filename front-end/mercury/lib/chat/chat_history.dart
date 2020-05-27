import 'package:flutter/material.dart';

import './chat_message.dart';
import '../models/message.dart';

class ChatHistory extends StatelessWidget {
  final List<Message> _messages;

  ChatHistory(this._messages);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: 200,
      color: Colors.amberAccent,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Scrollbar(
              child: ListView(
                reverse: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ..._messages.map((e) => (ChatMessage(e))).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
