import 'package:flutter/material.dart';
import 'package:mercury/models/group_view_model.dart';
import 'package:mercury/providers/groups_provider.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/widgets/groups/group.dart';
import 'package:provider/provider.dart';
import 'package:mercury/services/chat_group_service.dart';

import 'group_new.dart';

class GroupPanel extends StatefulWidget {
  @override
  _GroupPanelState createState() => _GroupPanelState();
}

class _GroupPanelState extends State<GroupPanel> {
  GroupsProvider _groupsProvider;
  UserProvider _userProvider;
  bool _hasLoadedGroups = false;

  @override
  void didChangeDependencies() {
    if (_userProvider == null)
      _userProvider = Provider.of<UserProvider>(context, listen: false);
    if (_groupsProvider == null)
      _groupsProvider = Provider.of<GroupsProvider>(context, listen: false);

    if (!_hasLoadedGroups) _getGroups();

    super.didChangeDependencies();
  }

  void _createGroup(String groupName, GroupsProvider groupsProvider) async {
    final groupCreateReply = await ChatGroupService().requestCreate(groupName);

    if (groupCreateReply != null)
      groupsProvider.addGroup(GroupViewModel(
        groupId: groupCreateReply.groupId,
        groupName: groupName,
      ));
  }

  void _navigateToNewGroupScreen(BuildContext context) {
    Navigator.of(context).pushNamed(GroupNew.route);
  }

  void _getGroups() async {
    final groups =
        ChatGroupService().requestGroupsByUserId(_userProvider.user.id);

    _groupsProvider.loadGroups(groups);
    _hasLoadedGroups = true;
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
          onPressed: () => _navigateToNewGroupScreen(context),
          child: Icon(Icons.add),
          backgroundColor: Colors.indigo,
        ),
      ),
    );
  }
}
