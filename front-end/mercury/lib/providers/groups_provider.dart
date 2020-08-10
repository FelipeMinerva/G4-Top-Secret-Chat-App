import 'package:flutter/foundation.dart';
import 'package:mercury/services/chat_group_service.dart';
import 'package:mercury/services/gen/services/chat_group.pb.dart';

import '../models/group_view_model.dart';

class GroupsProvider with ChangeNotifier {
  List<GroupViewModel> _groups;
  ChatGroupService service = ChatGroupService();

  List<GroupViewModel> get groups {
    if (_groups == null) _groups = List<GroupViewModel>();
    return [..._groups];
  }

  Future<void> load(Stream<GetGroupsByUserReply> groups) async {
    _groups = List<GroupViewModel>();
    groups.listen((group) => add(GroupViewModel.fromProto(group.group)));

    notifyListeners();
  }

  void add(GroupViewModel group) {
    _groups.add(group);
    notifyListeners();
  }
}
