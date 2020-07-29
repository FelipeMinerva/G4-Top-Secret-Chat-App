import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mercury/models/message_view_model.dart';
import 'package:mercury/models/user_view_model.dart';
import 'package:mercury/services/chat_service.dart';
import 'package:mercury/services/gen/services/chat.pb.dart';
import 'package:mercury/singletons/connectivity_monitor.dart';

class MessagesProvider with ChangeNotifier {
  var _messages = List<MessageViewModel>();
  var outputStream = StreamController<SubscriptionRequest>();
  var service = ChatService();

  final connectivityMonitor = ConnectivityMonitor();

  List<MessageViewModel> get messages {
    return [..._messages];
  }

  void sendMessage(int userId, MessageViewModel message) {
    try {
      outputStream.onCancel = () {
        connectivityMonitor.connectivity.onConnectivityChanged.listen((status) {
          if (status != ConnectivityResult.none) {
            outputStream = StreamController<SubscriptionRequest>();
            loadMessages(service.requestMessages(outputStream.stream));
            _createStreamSeed(userId);
          }
        });
      };

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

  void _createStreamSeed(int userId) {
    outputStream.add(SubscriptionRequest()
      ..userId = userId
      ..message =
          MessageViewModel.asSubscriptionSeed(UserViewModel.simple(userId))
              .toProto());
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
