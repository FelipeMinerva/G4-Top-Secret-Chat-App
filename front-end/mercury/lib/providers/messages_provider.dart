import 'package:flutter/foundation.dart';
import 'package:mercury/models/message.dart';

class MessagesProvider with ChangeNotifier {
  List<Message> _messages;

  List<Message> get messages {
    if(_messages == null)
      _messages = List<Message>();
    return [..._messages];
  }

  void addMessage(Message message) {
    _messages.add(message);

    notifyListeners();
  }

  void loadMessages(Stream<Message> messages) async {
    await for (var message in messages) {
      _messages.add(message);
    }

    notifyListeners();
  }
}
