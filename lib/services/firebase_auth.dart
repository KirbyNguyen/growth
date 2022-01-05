import 'package:firebase_auth/firebase_auth.dart';
import 'package:growth/constants/auth_status.dart';

/// [AuthenticationService] provides methods for authenticating through email,
/// Google, and Apple.
class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChange => _firebaseAuth.authStateChanges();

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

  Future<AuthStatus> signUpWithEmail(
      {required String email,
      required String password,
      required String name}) async {
    try {
      UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      user!.updateDisplayName(name);

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

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
