import 'package:flutter/foundation.dart';
import 'package:mercury/models/message_view_model.dart';

class MessagesProvider with ChangeNotifier {
  List<MessageViewModel> _messages;

  List<MessageViewModel> get messages {
    if(_messages == null)
      _messages = List<MessageViewModel>();
    return [..._messages];
  }

  void addMessage(MessageViewModel message) {
    _messages.add(message);

    notifyListeners();
  }

  Future<void> loadMessages(Stream<MessageViewModel> messages) async {
    await for (var message in messages) {
      _messages.add(message);
    }

    notifyListeners();
  }
}
