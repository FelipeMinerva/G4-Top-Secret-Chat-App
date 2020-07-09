import 'package:mercury/enum/message_status.dart';
import 'package:mercury/models/user_view_model.dart';

class MessageViewModel {
  UserViewModel sender;
  UserViewModel recipient;
  String text;
  DateTime timestamp;
  MessageStatus status;

  MessageViewModel(this.sender, this.text){
    this.timestamp = DateTime.now();
  }
}


