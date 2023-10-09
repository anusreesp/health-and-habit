import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fireAuthServiceProvider = Provider((ref) {
  return FireAuthenticate(FirebaseAuth.instance);
});

class FireAuthenticate {
  FireAuthenticate(this.auth);

  final FirebaseAuth auth;

  User? currentUser() => auth.currentUser;

  String get userId => auth.currentUser?.uid ?? '';

  Future<UserCredential> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential;
    } on FirebaseAuthException catch (e) {
      throw e.message.toString();
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> registerEmailPassword(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw ('The account already exists for this email.');
      } else {
        throw e.code;
      }
    } catch (e) {
      rethrow;
    }
  }
}
