import 'package:mercury/enum/message_status.dart';
import 'package:mercury/models/user.dart';

class Message {
  User sender;
  User recipient;
  String text;
  DateTime timestamp;
  MessageStatus status;

  Message(this.sender, this.text);
}


