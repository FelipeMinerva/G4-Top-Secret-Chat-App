import 'package:flutter/material.dart';
import 'package:mercury/models/group_view_model.dart';
import 'package:mercury/providers/groups_provider.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:provider/provider.dart';

class GroupBottomSheet extends StatefulWidget {
  @override
  _GroupBottomSheetState createState() => _GroupBottomSheetState();
}

class _GroupBottomSheetState extends State<GroupBottomSheet> {
  final _groupNameController = TextEditingController();
  final _membersController = TextEditingController();
  var _isButtonEnabled = true;

  @override
  Widget build(BuildContext context) {
    final groupsProvider = Provider.of<GroupsProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
          ),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.group),
                onTap: () => Navigator.pop(context),
                title: TextField(
                  controller: _groupNameController,
                  autofocus: true,
                  decoration: InputDecoration.collapsed(
                    border: InputBorder.none,
                    hintText: 'Enter group\'s name',
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.group_add),
                onTap: () => Navigator.pop(context),
                title: TextField(
                  controller: _membersController,
                  decoration: InputDecoration.collapsed(
                    border: InputBorder.none,
                    hintText: 'Enter members',
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.group_add),
                onTap: () => Navigator.pop(context),
                title: TextFormField(
                  // autovalidate: true,
                  // validator: (String text) => _validateGroupName(text),
                  controller: _membersController,
                  decoration: InputDecoration.collapsed(
                    border: InputBorder.none,
                    hintText: 'Enter members',
                  ),
                ),
              ),
              ListTile(
                title: RaisedButton(
                    child: Text(
                      'Create',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.indigo,
                    disabledColor: Colors.grey,
                    onPressed: _groupNameController.text.length < 1
                        ? null
                        : () => {
                              _createGroup(
                                  groupName: _groupNameController.text,
                                  usersId: <int>[userProvider.user.id],
                                  groupsProvider: groupsProvider),
                              Navigator.pop(context),
                            }),
              ),
            ]),
      ),
    );
  }

  String _validateGroupName(String text) {
    text.length < 1
        ? setState(() => _isButtonEnabled = true)
        : setState(() => _isButtonEnabled = false);

    return text;
  }

  Future<void> _createGroup({
    GroupsProvider groupsProvider,
    String groupName,
    List<int> usersId,
  }) async {
    final group =
        await groupsProvider.service.requestCreate(groupName, usersId);

    groupsProvider
        .add(GroupViewModel(groupId: group.groupId, groupName: groupName));
  }
}
