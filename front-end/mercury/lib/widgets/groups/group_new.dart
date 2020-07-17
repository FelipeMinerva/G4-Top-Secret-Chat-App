import 'package:flutter/material.dart';
import 'package:mercury/models/group_view_model.dart';
import 'package:mercury/providers/groups_provider.dart';
import 'package:provider/provider.dart';

class GroupNew extends StatelessWidget {
  static const route = '/group-new';
  final _newGroupName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final groupsProvider = Provider.of<GroupsProvider>(context, listen: false);

    return Scaffold(
      body: Stack(children: <Widget>[
        TextField(
          controller: _newGroupName,
          autofocus: true,
          decoration: InputDecoration.collapsed(
            border: InputBorder.none,
            hintText: 'Enter this group\'s name',
          ),
        ),
        RaisedButton(onPressed: () => groupsProvider.addGroup(GroupViewModel()))
      ]),
    );
  }
}
