import 'package:flutter/material.dart';
import 'package:mercury/enum/message_status.dart';
import 'package:mercury/models/message_view_model.dart';
import 'package:mercury/providers/messages_provider.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/services/chat_service.dart';
import 'package:provider/provider.dart';

import '../../models/message_view_model.dart';

class ChatInput extends StatefulWidget {
  final FocusNode _focusNode;
  final int _groupId;

  ChatInput(this._focusNode, this._groupId);

  @override
  _ChatInputState createState() => _ChatInputState(_focusNode, _groupId);
}

class _ChatInputState extends State<ChatInput> {
  final FocusNode _focusNode;
  final inputController = TextEditingController();
  final int _groupId;
  bool _isSendButtonDisabled;

  _ChatInputState(this._focusNode, this._groupId);

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

  void _onSend({String messageText, BuildContext context}) {
    final messagesProvider = Provider.of<MessagesProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    messageText = messageText.trim();

    final message = MessageViewModel(
        user: userProvider.user,
        text: messageText,
        groupId: _groupId,
        status: MessageStatus.pending);

    final chatService = ChatService().push(message.toProto());

    if (messageText.trim() != '' && chatService != null) {
      messagesProvider.addMessage(message);
      inputController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.indigo, width: 0.5),
        ),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 1.0),
              child: IconButton(
                icon: Icon(Icons.image),
                onPressed: null,
                color: Colors.indigo,
              ),
            ),
            color: Colors.white,
          ),
          Flexible(
            child: Container(
              child: TextField(
                // Stylus
                // maxLength: 1023,
                focusNode: _focusNode,
                textCapitalization: TextCapitalization.sentences,
                showCursor: true,
                keyboardType: TextInputType.multiline,
                maxLines: null,

                // Functional setup
                onSubmitted: (text) => _onSend(
                  context: context,
                  messageText: text,
                ),
                cursorColor: Colors.indigo,
                controller: inputController,
                decoration: InputDecoration.collapsed(
                  border: InputBorder.none,
                  hintText: 'Enter Message',
                ),
                onChanged: (z) => _checkSendButtonDisability(z),
                onTap: () => _focusNode.requestFocus(),
              ),
            ),
          ),
          Material(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _isSendButtonDisabled
                    ? null
                    : _onSend(
                        context: context,
                        messageText: inputController.text,
                      ),
                color: Colors.indigo,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
    );

    // }
    // return Container(
    //     child: Row(
    //       children: <Widget>[
    //         // Button send image
    //         Material(
    //           child: Container(
    //             margin: EdgeInsets.symmetric(horizontal: 1.0),
    //             child: IconButton(
    //               icon: Icon(Icons.image),
    //               onPressed: null,
    //               color: Colors.indigo,
    //             ),
    //           ),
    //           color: Colors.white,
    //         ),
    //         Material(
    //           child: Container(
    //             margin: EdgeInsets.symmetric(horizontal: 1.0),
    //             child: IconButton(
    //               icon: Icon(Icons.face),
    //               onPressed: null,
    //               color: Colors.indigo,
    //             ),
    //           ),
    //           color: Colors.white,
    //         ),

    //         // Edit text
    //         Flexible(
    //           child: Container(
    //             child: TextField(
    //               style: TextStyle(color: Colors.indigo, fontSize: 15.0),
    //               controller: inputController,
    //               decoration: InputDecoration.collapsed(
    //                 hintText: 'Type your message...',
    //                 hintStyle: TextStyle(color: Colors.grey),
    //               ),
    //               focusNode: _focusNode,
    //             ),
    //           ),
    //         ),

    //         // Button send message
    //         Material(
    //           child: Container(
    //             margin: EdgeInsets.symmetric(horizontal: 8.0),
    //             child: IconButton(
    //               icon: Icon(Icons.send),
    //               onPressed: () => _send(Message(User('Felipinho'), inputController.text)),
    //               color: Colors.indigo,
    //             ),
    //           ),
    //           color: Colors.white,
    //         ),
    //       ],
    //     ),
    //     width: double.infinity,
    //     height: 50.0,
    //     decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.blueGrey, width: 0.5)), color: Colors.white),
    //   );
  }
}
