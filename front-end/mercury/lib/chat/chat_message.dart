import 'package:flutter/material.dart';
import 'package:mercury/models/message.dart';

class ChatMessage extends StatelessWidget {
  final Message _message;

  ChatMessage(this._message);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(_message.sender.name),
              Text(_message.text),
            ],
          )
        ],
      ),
    );
  }
}
