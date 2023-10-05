import 'package:animate_you/authenticate/login.dart';
import 'package:animate_you/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartPage extends ConsumerWidget {
  static const route = "/";
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return const SplashScreen();
    return LoginScreen();
  }
}
