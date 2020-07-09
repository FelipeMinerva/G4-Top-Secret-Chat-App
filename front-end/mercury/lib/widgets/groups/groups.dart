import 'package:flutter/material.dart';
import 'package:mercury/models/group_view_model.dart';
import 'package:mercury/providers/groups_provider.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/services/chat_group_service.dart';
import 'package:mercury/widgets/groups/group.dart';
import 'package:provider/provider.dart';

class Groups extends StatefulWidget {
  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  Stream<GroupViewModel> _getGroups(int userId) async* {
    final groups = ChatGroupService().requestGroupsByUserId(userId);

    // groups.listen((group) => GroupViewModel(groupId: group.group.groupId, groupName: group.group.groupName));

    // await for (var group in groups) {
    //   yield GroupViewModel(
    //       groupId: group.group.groupId, groupName: group.group.groupName);
    // }
  }

  void _createGroup(String groupName, GroupsProvider groupsState) async {
    final groupCreateReply = await ChatGroupService().requestCreate(groupName);

    if (groupCreateReply != null) {
      groupsState.addGroup(GroupViewModel()
        ..groupId = groupCreateReply.groupId
        ..groupName = groupName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserProvider>(context);
    final groupState = Provider.of<GroupsProvider>(context);

    // final groups =ChatGroupService().requestGroupsByUserId(userState.user.userId);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(userState.user.name),
          backgroundColor: Colors.indigo,
        ),
        // body: StreamBuilder(
        //     builder:
        //         (BuildContext context, AsyncSnapshot<GroupViewModel> snapshot) {
        //       if (snapshot.connectionState == ConnectionState.done) {
        //         return Column(
        //             children: groupState.groups.length < 1
        //                 ? groupState.groups.map((e) => Group(e)).toList()
        //                 : Text('Deu merda'));
        //       } else
        //         return Text('loading');
        //     },
        //     stream: _getGroups(userState.user.userId)),
        body: Column(
          children: groupState.groups.length < 1
              ? groupState.groups.map((e) => Group(e)).toList()
              : <Widget>[Text('Deu merda')],
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () => _createGroup('TestGroup', groupState),
        //if you set mini to true then it will make your floating button small
        child: Icon(Icons.timer),
        ),
      ),
    );
  }
}
