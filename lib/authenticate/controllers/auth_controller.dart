import 'package:animate_you/authenticate/data/service/fire_auth_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthController, AuthStates>((ref) {
  final service = ref.watch(fireAuthServiceProvider);
  return AuthController(service);
});

class AuthController extends StateNotifier<AuthStates> {
  final FireAuthenticate service;
  AuthController(this.service) : super(AuthInitial()) {
    checkUser();
  }

  checkUser() async {
    state = AuthLoading();

    try {
      state = AuthOnboard();
      final user = service.currentUser();

      if (user != null) {
        state = AuthLoadedWithoutData(user.email, user.displayName);

        return;
      } else {
        state = AuthInitial();
      }
    } catch (e) {
      state = AuthError(e.toString());
    }
  }

  emailLogin(String email, String password) async {
    try {
      state = AuthLoading();

      final credential = await service.loginWithEmailPassword(
          email: email, password: password);

      checkUser();
    } catch (e) {
      state = AuthError(e.toString());
    }
  }
}

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthLoaded extends AuthStates {}

class AuthLoadedWithoutData extends AuthStates {
  final String? email;
  final String? name;
  AuthLoadedWithoutData(this.email, this.name);
}

class AuthError extends AuthStates {
  final String error;
  AuthError(this.error);
}

class AuthOnboard extends AuthStates {}
