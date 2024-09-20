import 'package:notes/services/auth/auth_user.dart';

abstract class AuthProvider {
  AuthUser? get currentUser;

  // log-in a user
  Future<AuthUser> loginUser({
    required String email,
    required String password,
  });
  // create a user
  Future<AuthUser> createUser({
    required String email,
    required String password,
  });
  // log-out a user
  Future<void> logoutUser();
  //verify email for a  registered user
  Future<void> verifyUserEmail();
}
