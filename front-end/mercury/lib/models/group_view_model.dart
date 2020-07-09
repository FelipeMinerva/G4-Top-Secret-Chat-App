class GroupViewModel {
  int groupId;
  String groupName;

  GroupViewModel({this.groupId, this.groupName});

  GroupViewModel.fromModel(GroupViewModel group) {
    this.groupId = group.groupId;
    this.groupName = group.groupName;
  }
}
