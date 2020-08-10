import 'package:flutter/material.dart';
import 'package:mercury/providers/groups_provider.dart';
import 'package:mercury/providers/messages_provider.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/widgets/groups/group_panel.dart';
import 'package:provider/provider.dart';

class GroupsScreen extends StatelessWidget {
  static const route = '/groups';

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final messagesProvider = Provider.of<MessagesProvider>(context, listen: false);

    messagesProvider.open(userProvider.user);

    return ChangeNotifierProvider(
      create: (context) => GroupsProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(userProvider.user.tag),
          backgroundColor: Colors.indigo,
        ),
        body: GroupPanel(),
      ),
    );
  }
}
