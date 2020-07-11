import 'package:flutter/material.dart';
import 'package:mercury/models/group_view_model.dart';
import 'package:mercury/providers/groups_provider.dart';
import 'package:mercury/widgets/groups/group.dart';
import 'package:provider/provider.dart';
import 'package:mercury/services/chat_group_service.dart';


class GroupPanel extends StatelessWidget {

  void _createGroup(String groupName, GroupsProvider groupsProvider) async {
    final groupCreateReply = await ChatGroupService().requestCreate(groupName);

    if (groupCreateReply != null)
      groupsProvider.addGroup(GroupViewModel()
        ..groupId = groupCreateReply.groupId
        ..groupName = groupName);
  }

  @override
  Widget build(BuildContext context) {
    final groupsProvider = Provider.of<GroupsProvider>(context);

    return Container(
      child: Scaffold(
              body: ListView(
          children: groupsProvider != null && groupsProvider.groups.length >= 1
              ? groupsProvider.groups
                  .map((e) => Group(e, groupsProvider.groups.indexOf(e).isOdd))
                  .toList()
              : <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Welp, you don\'t have any groups yet :(',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
        ),
                floatingActionButton: new FloatingActionButton(
          onPressed: () => _createGroup('TestGroup', groupsProvider),
          child: Icon(Icons.add),
          backgroundColor: Colors.indigo,
        ),
      ),
    );
  }
}
