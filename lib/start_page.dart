import 'package:animate_you/authenticate/controllers/auth_controller.dart';
import 'package:animate_you/authenticate/presentation/screens/login.dart';
import 'package:animate_you/features/home_page.dart';
import 'package:animate_you/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartPage extends ConsumerWidget {
  static const route = "/";
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {
      if (next is AuthError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(next.error)));
      }
    });

    if (authController is AuthLoaded ||
        authController is AuthLoadedWithoutData) {
      return HomePage();
    }

    if (authController is AuthOnboard) {
      return SplashScreen();
    }

    // return const SplashScreen();
    return LoginScreen();
  }
}
