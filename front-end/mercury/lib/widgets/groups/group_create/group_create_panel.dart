import 'package:flutter/material.dart';

class CreateGroupPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Abeoji',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                const Radius.circular(5),
              ),
            ),
            child: TextField(
              maxLength: 64,
              textCapitalization: TextCapitalization.sentences,
              showCursor: true,
              decoration: InputDecoration.collapsed(
                border: InputBorder.none,
                hintText: 'Enter group\'s name',
              ),
            ),
          )
        ],
      ),
    );
  }
}
