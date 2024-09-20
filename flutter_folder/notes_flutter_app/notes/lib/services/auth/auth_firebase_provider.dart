import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException;
import 'package:notes/services/auth/auth_provider.dart';
import 'package:notes/services/auth/auth_user.dart';
import 'package:notes/services/auth/auth_exceptions.dart';

class AuthFirebaseProvider implements AuthProvider {
  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = currentUser;

      if (user != null) {
        return user;
      } else {
        throw UserNotLogedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromfirebaseAuth(user);
    } else {
      return null;
    }
  }

  @override
  Future<AuthUser> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      if (currentUser != null) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {}
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  @override
  Future<void> logoutUser() {
    throw UnimplementedError();
  }

  @override
  Future<void> verifyUserEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.sendEmailVerification();
    throw UnimplementedError();
  }
}
