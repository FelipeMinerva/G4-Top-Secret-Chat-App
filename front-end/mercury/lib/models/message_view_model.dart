import 'package:mercury/enum/message_status.dart';

class MessageViewModel {
  int userId;
  String text;
  MessageStatus status;
  int groupId;
  DateTime timestamp;

  MessageViewModel({this.userId, this.text, this.status, this.groupId}) {
    this.timestamp = DateTime.now();
  }
}
