import 'package:flutter/material.dart';
import 'package:mercury/providers/messages_provider.dart';
import 'package:mercury/providers/user_provider.dart';
import 'package:mercury/widgets/groups/groups_screen.dart';
import 'package:mercury/widgets/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/chat/chat_screen.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MessagesProvider(),
        )
      ],
      child: Mercury(),
    ));

class Mercury extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MercuryState();
  }
}

class _MercuryState extends State<Mercury> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return _createRoute(LoginScreen());
          case ChatScreen.route:
            return _createRoute(ChatScreen(settings.arguments));
          case GroupsScreen.route:
            return _createRoute(GroupsScreen());
          // case GroupNew.route:
          // return _createRoute(GroupNew(settings.arguments));
          default:
            return _createRoute(LoginScreen());
        }
      },
    );
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

  void _checkOpenSession() async {
    final userProvider = Provider.of<UserProvider>(context);

    final prefs = await SharedPreferences.getInstance();

    final userEmail = prefs.getString('user_email');
    final userTag = prefs.getString('user_tag');

    if (userEmail != null && userTag != null) {
      userProvider.user.email = userEmail;
      userProvider.user.tag = userTag;
    }
  }
}
