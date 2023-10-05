import 'package:animate_you/router.dart';
import 'package:animate_you/start_page.dart';
import 'package:animate_you/theme.dart';
import 'package:flutter/material.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health and Habit', theme: AppTheme.light(),
      initialRoute: StartPage.route, routes: routesList,
      onGenerateRoute: RouteGenerator.generateRoute,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
