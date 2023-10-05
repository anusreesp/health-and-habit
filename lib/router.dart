import 'package:animate_you/start_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // switch (settings.name) {
    //   // case Dashboard.route:
    //   //   return MaterialPageRoute(builder: (_) => const Dashboard());
    //   // case HomeScreen.route:
    //   //   return MaterialPageRoute(builder: (_) => const HomeScreen());
    //   case StartupPage.route:
    return MaterialPageRoute(builder: (_) => const StartPage());
    // }
  }
}

final Map<String, Widget Function(BuildContext)> routesList = {};
