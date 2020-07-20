import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mercury/enum/message_status.dart';
import 'package:mercury/models/message_view_model.dart';
import 'package:mercury/models/user_view_model.dart';
import 'package:mercury/services/gen/services/chat.pb.dart';

class MessagesProvider with ChangeNotifier {
  List<MessageViewModel> _messages = List<MessageViewModel>();
  StreamController<SubscriptionRequest> outputStream =
      StreamController<SubscriptionRequest>();

  List<MessageViewModel> get messages {
    return [..._messages];
  }

  void sendMessage(int userId, MessageViewModel message) {
    outputStream.add(SubscriptionRequest()
      ..message = MessageViewModel(
              groupId: 1,
              status: MessageStatus.pending,
              text: 'picles',
              user: UserViewModel(
                  id: userId, email: 'felipe@mercuy.com', tag: 'minerva'))
          .toProto()
      ..userId = userId);
    outputStream.add(SubscriptionRequest()
      ..message = MessageViewModel(
              groupId: 1,
              status: MessageStatus.pending,
              text: 'picles',
              user: UserViewModel(
                  id: userId, email: 'felipe@mercuy.com', tag: 'minerva'))
          .toProto()
      ..userId = userId);
    if (message != null) addMessage(message);
  }

  void addMessage(MessageViewModel message) {
    _messages.add(message);

    notifyListeners();
  }

  Future<void> loadMessages(Stream<SubscriptionReply> messages) async {
    _messages = List<MessageViewModel>();
    messages.listen((message) =>
        _messages.add(MessageViewModel.fromProto(message.message)));

    notifyListeners();
  }
}
