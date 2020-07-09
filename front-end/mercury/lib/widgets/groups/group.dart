import 'package:flutter/material.dart';
import 'package:mercury/models/group_view_model.dart';

class Group extends StatelessWidget {
  final GroupViewModel _group;

  Group(this._group);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_group.groupName)
    );
  }
}