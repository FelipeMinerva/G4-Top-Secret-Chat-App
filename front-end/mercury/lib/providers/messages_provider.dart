import 'package:flutter/foundation.dart';
import 'package:mercury/enum/message_status.dart';
import 'package:mercury/models/message_view_model.dart';
import 'package:mercury/models/user_view_model.dart';
import 'package:mercury/services/gen/chat.pb.dart';

class MessagesProvider with ChangeNotifier {
  List<MessageViewModel> _messages;

  List<MessageViewModel> get messages {
    if (_messages == null) _messages = List<MessageViewModel>();
    return [..._messages];
  }

  void addMessage(MessageViewModel message) {
    _messages.add(message);

    notifyListeners();
  }

  Future<void> loadMessages(Stream<SubscriptionReply> messages) async {
    await for (var message in messages) {
      _messages.add(MessageViewModel(
          text: message.message.text,
          userId: message.message.userId,
          groupId: message.message.groupId,
          status: MessageStatus.pending));
    }

    notifyListeners();
  }
}
