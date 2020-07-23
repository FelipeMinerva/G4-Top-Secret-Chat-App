import 'package:mercury/enum/message_status.dart';
import 'package:mercury/models/user_view_model.dart';
import 'package:mercury/services/gen/system/message.pb.dart';

class MessageViewModel {
  UserViewModel user;
  String text;
  MessageStatus status;
  int groupId;
  DateTime timestamp;

  MessageViewModel({this.user, this.text, this.status, this.groupId}) {
    this.timestamp = DateTime.now();
  }

  MessageViewModel.asSubscriptionSeed(UserViewModel user){
    this.user = user;
    this.groupId = 0;
    this.text = '';
    this.timestamp = DateTime.now();
    this.status = MessageStatus.pending;
  }

  MessageViewModel.fromProto(Message proto) {
    if (proto == null) return;

    this.user = UserViewModel.fromProto(proto.user);
    this.text = proto.text;
    this.groupId = proto.groupId;
    this.status = MessageStatus.pending;
    this.timestamp = DateTime.parse(proto.timestamp);
  }

  Message toProto() {
    if (this == null) return null;

    return Message()
      ..user = this.user.toProto()
      ..timestamp = this.timestamp.toString()
      ..groupId = this.groupId
      ..text = this.text;
  }
}
