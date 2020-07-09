import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mercury/models/message_view_model.dart';

class ChatMessage extends StatelessWidget {
  final MessageViewModel _message;

  ChatMessage(this._message);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: <Widget>[
                Text(
                  _message.sender.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  ' ' +
                      DateFormat('dd/MM/yyyy hh:mm').format(_message.timestamp),
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(_message.text),
          ),
        ],
      ),
    );
  }
}
