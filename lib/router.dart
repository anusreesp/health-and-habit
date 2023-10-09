import 'package:animate_you/authenticate/presentation/screens/login.dart';
import 'package:animate_you/authenticate/presentation/screens/signup.dart';
import 'package:animate_you/splash_screen.dart';
import 'package:animate_you/start_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StartPage.route:
        return MaterialPageRoute(builder: (_) => const StartPage());
      case SplashScreen.route:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text("No route found")),
                ));
    }
  }
}

final Map<String, Widget Function(BuildContext)> routesList = {
  LoginScreen.route: (context) => LoginScreen(),
  SignUpScreen.route: (context) => SignUpScreen(),
};
