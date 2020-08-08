import 'package:flutter/material.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/widgets/groups/groups_screen.dart';
import 'package:mercury/widgets/login/login_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final route = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: Provider.of<UserProvider>(context).checkOpenSession(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) =>
          _build(snapshot),
    );
  }

  Widget _build(AsyncSnapshot<int> snapshot) {
    if (snapshot.hasData) {
      final user = Provider.of<UserProvider>(context).user;
      if (user.id != null)
        // Navigator.of(context).pushNamed(GroupsScreen.route);
        return GroupsScreen();
      else
        // Navigator.of(context).pushNamed(LoginScreen.route);
        return LoginScreen();
    } else if (snapshot.hasError) {
      return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ]),
      );
    } else {
      return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ]),
      );
    }
  }
}
