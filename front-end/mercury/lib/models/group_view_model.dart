import 'package:mercury/services/gen/system/group.pb.dart';

class GroupViewModel {
  int groupId;
  String groupName;

  GroupViewModel({this.groupId, this.groupName});

  GroupViewModel.fromModel(GroupViewModel group) {
    this.groupId = group.groupId;
    this.groupName = group.groupName;
  }

  GroupViewModel.fromProto(Group proto) {
    this.groupId = proto.groupId;
    this.groupName = proto.groupName;
  }

  Group toProto() {
    if (this == null) return null;

    return Group()
      ..groupName = this.groupName
      ..groupId = this.groupId;
  }
}
