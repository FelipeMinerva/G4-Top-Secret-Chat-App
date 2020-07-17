import 'package:flutter/material.dart';
import 'package:mercury/providers/groups_provider.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/services/chat_group_service.dart';
import 'package:mercury/widgets/groups/group_panel.dart';
import 'package:provider/provider.dart';

class GroupsScreen extends StatefulWidget {
  static const route = '/groups';

  @override
  _GroupsScreenState createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
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

  void _getGroups() async {
    final groups =
        ChatGroupService().requestGroupsByUserId(_userProvider.user.id);

    _groupsProvider.loadGroups(groups);
    _hasLoadedGroups = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_userProvider.user.tag),
          backgroundColor: Colors.indigo,
        ),
        body: GroupPanel(),
      ),
    );
  }
}
