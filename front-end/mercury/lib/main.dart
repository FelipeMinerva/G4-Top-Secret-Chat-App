import 'package:flutter/material.dart';
import 'package:mercury/providers/messages_provider.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/widgets/groups/group_create/group_create_screen.dart';
import 'package:mercury/widgets/groups/groups_screen.dart';
import 'package:mercury/widgets/home/home_screen.dart';
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
    return MaterialApp(
      showPerformanceOverlay: false,
      onGenerateRoute: _generateRoutes,
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          primaryColor: Colors.indigo,
          accentColor: Colors.indigoAccent,
          canvasColor: Colors.white,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900
            ),
          )),
    );
  }
}

Route _generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return _createRoute(HomeScreen());
    case LoginScreen.route:
      return _createRoute(LoginScreen());
    case ChatScreen.route:
      return _createRoute(ChatScreen(settings.arguments));
    case GroupsScreen.route:
      return _createRoute(GroupsScreen());
    case CreateGroupScreen.route:
      return _createRoute(CreateGroupScreen());
    default:
      return _createRoute(LoginScreen());
  }
}

Route _createRoute(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
