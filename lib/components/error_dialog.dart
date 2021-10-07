import 'package:flutter/material.dart';
import 'package:growth/constants/auth_status.dart';

/// [CustomErrorDialog] provides functions for displaying custom error dialogs.
class CustomErrorDialog {
  BuildContext context;
  CustomErrorDialog({required this.context});

  /// Takes in [AuthStatus] and translates it into an appropriate [String].
  String parseAuthStatus(AuthStatus status) {
    switch (status) {
      case AuthStatus.successful:
        return "";
      case AuthStatus.emailAlreadyInUse:
        return "This email is already used.";
      case AuthStatus.userDisabled:
        return "This account is disabled.";
      case AuthStatus.invalidEmail:
        return "This email is invalid.";
      case AuthStatus.weakPassword:
        return "This password is weak.";
      case AuthStatus.wrongPassword:
      case AuthStatus.userNotFound:
        return "No combination of this email and password is found.";
      default:
        return "Unidentified error.";
    }
  }

  /// Takes [AuthStatus] and display it as a [String] with an [AlertDialog].
  Future<dynamic> showError(AuthStatus status) {
    String errorText = parseAuthStatus(status);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(errorText),
          actions: [
            TextButton(
              child: const Text("Confirm"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
