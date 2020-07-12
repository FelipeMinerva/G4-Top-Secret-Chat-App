import 'package:flutter/foundation.dart';
import 'package:mercury/models/message_view_model.dart';
import 'package:mercury/services/gen/services/chat.pb.dart';

class MessagesProvider with ChangeNotifier {
  List<MessageViewModel> _messages;

  List<MessageViewModel> get messages {
    if (_messages == null) _messages = List<MessageViewModel>();
    return [..._messages];
  }

  void addMessage(MessageViewModel message) {
    if (_messages == null) _messages = List<MessageViewModel>();
    _messages.insert(_messages.length - 1, message);

    notifyListeners();
  }

  Future<void> loadMessages(Stream<SubscriptionReply> messages) async {
    await for (var message in messages) {
      print(message.message.text);
      addMessage(MessageViewModel.fromProto(message.message));
    }

    notifyListeners();
  }
}
