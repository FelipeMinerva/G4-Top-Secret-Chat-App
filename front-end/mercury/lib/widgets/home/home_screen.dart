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
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return FutureBuilder<int>(
      future: userProvider.checkOpenSession(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) =>
          _build(snapshot, userProvider),
    );
  }

  Widget _build(AsyncSnapshot<int> snapshot, UserProvider userProvider) {
    if (snapshot.hasData) {
      final user = userProvider.user;
      if (user.id != null) return GroupsScreen();
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
