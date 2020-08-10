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

  List<MessageViewModel> get messages => [..._messages];

  void open(UserViewModel user) {
    send(MessageViewModel.asSubscriptionSeed(user));
    final messages = service.requestMessages(outputStream.stream);
    load(messages);
  }

  void send(MessageViewModel message) {
    try {
      outputStream.onCancel = () {
        connectivityMonitor.connectivity.onConnectivityChanged.listen((status) {
          if (status != ConnectivityResult.none) {
            outputStream = StreamController<SubscriptionRequest>();
            load(service.requestMessages(outputStream.stream));
            _createStreamSeed(message.user.id);
          }
        });
      };

      outputStream.add(SubscriptionRequest()
        ..userId = message.user.id
        ..message = message.toProto());

      if (message != null) add(message);
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

  void add(MessageViewModel message) {
    _messages.add(message);

    notifyListeners();
  }

  Future<void> load(Stream<SubscriptionReply> messages) async {
    _messages = List<MessageViewModel>();
    messages
        .listen((message) => add(MessageViewModel.fromProto(message.message)));
  }
}
