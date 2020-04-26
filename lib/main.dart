import 'package:convo/screens/converstation_screen.dart';
import 'package:convo/screens/starter_topics_screen.dart';
import 'package:convo/screens/upgrade_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/starter_topics_screen.dart';

void main() => runApp(Convo());

class Convo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Convo",
      debugShowCheckedModeBanner: false,
      initialRoute: StarterTopicsScreen.id,
      routes: {
        RouteDecider.id: (context) => RouteDecider(),
        ConversationScreen.id: (context) => ConversationScreen(),
        StarterTopicsScreen.id: (context) => StarterTopicsScreen(),
        UpgradeScreen.id: (context) => UpgradeScreen(),
      },
    );
  }
}

// TODO fix the Android app Icon through ImageAsset
class RouteDecider extends StatelessWidget {
  static const String id = 'route_decider';

  void autoLogin(context) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String userId = pref.getString('email');

    if (userId != null) {
      print('Logged in automatically');
      //Navigator.pushReplacementNamed(context, Index.id);
      return;
    } else {
      print('First time sign in');
      //Navigator.pushReplacementNamed(context, Login.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    autoLogin(context);
    return Container();
  }
}
