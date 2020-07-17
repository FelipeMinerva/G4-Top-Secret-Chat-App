import 'package:flutter/foundation.dart';
import 'package:mercury/services/gen/services/chat_group.pb.dart';

import '../models/group_view_model.dart';

class GroupsProvider with ChangeNotifier {
  List<GroupViewModel> _groups;
  // var _hasLoaded = false;

  List<GroupViewModel> get groups {
    if (_groups == null) _groups = List<GroupViewModel>();
    return [..._groups];
  }

  Future<void> loadGroups(Stream<GetGroupsByUserReply> groups) async {
    // if (_hasLoaded) return;

    await for (var group in groups) {
      _groups.add(GroupViewModel(
        groupId: group.group.groupId,
        groupName: group.group.groupName,
      ));

      // _hasLoaded = true;
    }

    notifyListeners();
  }

  void addGroup(GroupViewModel group) {
    _groups.add(group);
    notifyListeners();
  }
}
