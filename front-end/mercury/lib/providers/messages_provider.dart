import 'package:flutter/foundation.dart';
import 'package:mercury/models/message_view_model.dart';
import 'package:mercury/services/gen/services/chat.pb.dart';

class MessagesProvider with ChangeNotifier {
  List<MessageViewModel> _messages = List<MessageViewModel>();

  List<MessageViewModel> get messages {
    return [..._messages];
  }

  void addMessage(MessageViewModel message) {
    _messages.add(message);

    notifyListeners();
  }

  Future<void> loadMessages(Stream<SubscriptionReply> messages) async {
    _messages = List<MessageViewModel>();
    messages.listen(
        (message) => addMessage(MessageViewModel.fromProto(message.message)));

    notifyListeners();
  }
}
