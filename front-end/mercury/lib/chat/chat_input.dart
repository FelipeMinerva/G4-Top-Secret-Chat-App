import 'package:flutter/material.dart';

import '../models/message.dart';
import '../models/user.dart';

class ChatInput extends StatefulWidget {
  final Function _send;
  final FocusNode _focusNode;

  ChatInput(this._send, this._focusNode);

  @override
  _ChatInputState createState() => _ChatInputState(_send, _focusNode);
}

class _ChatInputState extends State<ChatInput> {
  final Function _send;
  final FocusNode _focusNode;
  final inputController = TextEditingController();
  bool _isSendButtonDisabled;

  _ChatInputState(this._send, this._focusNode);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _isSendButtonDisabled = true;
    super.initState();
  }

  void _checkSendButtonDisability(String inputText) {
    setState(() {
      inputText.length > 0
          ? _isSendButtonDisabled = false
          : _isSendButtonDisabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: (z) => _send(Message(User('Felipinho'), z)),
              controller: inputController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Message',
              ),
              onChanged: (z) => _checkSendButtonDisability(z),
              onTap: () => _focusNode.requestFocus(),
              showCursor: true,
            ),
          ),
          RaisedButton(
            onPressed: () => (_isSendButtonDisabled
                ? null
                : _send(Message(User('Felipinho'), inputController.text))),
            child: Text('Send'),
            color: Colors.indigo,
            disabledColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
