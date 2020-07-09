import 'package:flutter/foundation.dart';

import '../models/group_view_model.dart';

class GroupsProvider with ChangeNotifier {
  List<GroupViewModel> _groups;

  List<GroupViewModel> get groups {
    if (_groups == null) _groups = List<GroupViewModel>();
    return [..._groups];
  }

  Future<void> loadGroups(Stream<GroupViewModel> groups) async {
    if (groups == null) return;

    await for (var group in groups) {
      _groups.add(group);

      notifyListeners();
    }
  }

  void addGroup(GroupViewModel group) {
    _groups.add(group);
    notifyListeners();
  }
}
