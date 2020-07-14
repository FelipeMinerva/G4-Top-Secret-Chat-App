import 'package:flutter/material.dart';
import 'package:mercury/models/group_view_model.dart';
import 'package:mercury/widgets/chat/chat_screen.dart';

class Group extends StatelessWidget {
  final GroupViewModel _group;
  final bool _offColored;

  Group(this._group, this._offColored);

  void _navigateToChat(BuildContext context) {
    Navigator.of(context).pushNamed(ChatScreen.route, arguments: _group);
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _offColored ? Colors.grey[200] : Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => _navigateToChat(context),
        splashColor: Colors.indigoAccent[100],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              child: Icon(Icons.people),
              backgroundColor: Colors.indigoAccent,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: Text(
                _group.groupName,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
