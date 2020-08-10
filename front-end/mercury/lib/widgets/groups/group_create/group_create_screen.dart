import 'package:flutter/material.dart';
import 'package:mercury/widgets/groups/group_create/group_create_panel.dart';

class CreateGroupScreen extends StatefulWidget {
  static const route = '/create-group';

  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create your new group')),
      body: CreateGroupPanel(),
    );
  }
}

