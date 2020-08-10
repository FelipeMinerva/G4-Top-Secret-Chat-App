import 'package:flutter/material.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:provider/provider.dart';

class CreateGroupPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * .6,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('Abeoji'),
              height: MediaQuery.of(context).size.height * .4,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.indigoAccent,
                borderRadius: BorderRadius.all(
                  const Radius.circular(5),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  const Radius.circular(5),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Group\'s name',
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    maxLength: 64,
                    textCapitalization: TextCapitalization.sentences,
                    showCursor: true,
                    decoration: InputDecoration.collapsed(
                      border: InputBorder.none,
                      hintText: userProvider.user.tag + '\'s new group',
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text('Create'),
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}
