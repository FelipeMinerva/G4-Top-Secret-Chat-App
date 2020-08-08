import 'package:flutter/material.dart';
import 'package:mercury/providers/messages_provider.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/widgets/groups/groups_screen.dart';
import 'package:mercury/widgets/login/login_screen.dart';
import 'package:provider/provider.dart';

import 'widgets/chat/chat_screen.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => MessagesProvider(),
          )
        ],
        child: Mercury(),
      ),
    );

class Mercury extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MercuryState();
}

class _MercuryState extends State<Mercury> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: Provider.of<UserProvider>(context).checkOpenSession(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            showPerformanceOverlay: false,
            onGenerateRoute: _generateRoutes,
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            onGenerateRoute: _generateRoutes,
            home: Center(
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
            ),
          );
        } else {
          return MaterialApp(
            onGenerateRoute: _generateRoutes,
            home: Center(
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
            ),
          );
        }
      },
    );
  }

  Route _generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        if (Provider.of<UserProvider>(context).user.id > 0)
          return _createRoute(GroupsScreen());

        return _createRoute(LoginScreen());

      case ChatScreen.route:
        return _createRoute(ChatScreen(settings.arguments));
      case GroupsScreen.route:
        return _createRoute(GroupsScreen());
      default:
        return _createRoute(LoginScreen());
    }
  }

  Widget _buildSplashScreen(AsyncSnapshot<int> snapshot) {
    if (snapshot.hasData) {
      print(Provider.of<UserProvider>(context).user.id);
      if (Provider.of<UserProvider>(context).user.id > 0)
        return GroupsScreen();
      else
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

  Route _createRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
