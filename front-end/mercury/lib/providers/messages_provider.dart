import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mercury/models/message_view_model.dart';
import 'package:mercury/services/chat_service.dart';
import 'package:mercury/services/gen/services/chat.pb.dart';

class MessagesProvider with ChangeNotifier {
  var _messages = List<MessageViewModel>();
  var outputStream = StreamController<SubscriptionRequest>();
  var service = ChatService();

  List<MessageViewModel> get messages {
    return [..._messages];
  }

  void sendMessage(int userId, MessageViewModel message) {
    try {
      outputStream.add(SubscriptionRequest()
        ..userId = userId
        ..message = message.toProto());

      if (message != null) addMessage(message);
    } catch (e) {
      print(e);
      service = ChatService();
      outputStream = StreamController<SubscriptionRequest>();
      service.requestMessages(outputStream.stream);
    }
  }

  void addMessage(MessageViewModel message) {
    _messages.add(message);

    notifyListeners();
  }

  Future<void> loadMessages(Stream<SubscriptionReply> messages) async {
    _messages = List<MessageViewModel>();
    messages.listen(
        (message) => addMessage(MessageViewModel.fromProto(message.message)));
  }
}
