import 'package:firebase_auth/firebase_auth.dart';
import 'package:growth/constants/auth_status.dart';

/// [AuthenticationService] provides authentication through the whole app.
class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

  /// [signInWithEmail] takes a [String] - email and a [String] - password. It
  /// returns an [AuthStatus] depending on the authentication.
  Future<AuthStatus> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthStatus.successful;
    } on FirebaseAuthException catch (authError) {
      // print("Failed with error code: ${authError.code}");
      // print(authError.message);

      switch (authError.code) {
        case "wrong-password":
          return AuthStatus.wrongPassword;
        case "user-disabled":
          return AuthStatus.userDisabled;
        case "user-not-found":
          return AuthStatus.userNotFound;
        default:
          return AuthStatus.undefined;
      }
    } catch (error) {
      // print("Error in signInWithEmailAndPassword()");
      // print(error);

      return AuthStatus.undefined;
    }
  }

  /// [signUpWithEmail] takes a [String] - email and a [String] - password. It
  /// returns an [AuthStatus] depending on the authentication.
  Future<AuthStatus> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthStatus.successful;
    } on FirebaseAuthException catch (authError) {
      // print("Failed with error code: ${authError.code}");
      // print(authError.message);

      switch (authError.code) {
        case "email-already-in-use":
          return AuthStatus.emailAlreadyInUse;
        case "invalid-email":
          return AuthStatus.invalidEmail;
        case "weak-password":
          return AuthStatus.weakPassword;
        default:
          return AuthStatus.undefined;
      }
    } catch (error) {
      // print("Error in signUpWithEmailAndPassword()");
      // print(error);

      return AuthStatus.undefined;
    }
  }

  /// [signOut] will log out the user and revoke any authentication.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
