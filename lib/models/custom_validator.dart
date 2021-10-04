class CustomValidator {
  /// Examines a [String] to see if it is a valid username.
  /// Takes a [String] - username and returns a [String] - result.
  static String validateUsername(String? username) {
    if (username!.isEmpty) {
      return "Please enter a value for 'Username'.\n";
    } else {
      return "";
    }
  }

  /// Examine a [String] to see if it is a valid email.
  /// Takes a [String] - email and returns a [String] - result.
  static String validateEmail(String? email) {
    // Email expression
    RegExp regex = RegExp(r'\w+@\w+\.\w+');
    if (email!.isEmpty) {
      return "Please enter a value for 'Email'.\n";
    } else if (!regex.hasMatch(email)) {
      return "'Email' is badly formatted.\n";
    } else {
      return "";
    }
  }

  /// Examine a [String] to see if it is a strong password
  /// Takes a [String] - password and returns a [String] - result.
  static String validatePassword(String? password) {
    // Uppercase expression
    RegExp hasUpper = RegExp(r'[A-Z]');
    // Lowercase expression
    RegExp hasLower = RegExp(r'[a-z]');
    // Digit expression
    RegExp hasDigit = RegExp(r'\d');
    // Punctuation expression
    RegExp hasPunct = RegExp(r'[!@#\$&*~-]');

    String error = "";
    if (password!.isEmpty) {
      error = "Please enter a value for 'Password'.\n";
      return error;
    } else if (!RegExp(r'.{8,}').hasMatch(password) ||
        !hasUpper.hasMatch(password) ||
        !hasLower.hasMatch(password) ||
        !hasDigit.hasMatch(password) ||
        !hasPunct.hasMatch(password)) {
      error = "'Password' must have at least:\n";
      if (!RegExp(r'.{8,}').hasMatch(password)) error += '\t\t8 characters\n';
      if (!hasUpper.hasMatch(password)) {
        error += '\t\tone uppercase character\n';
      }
      if (!hasLower.hasMatch(password)) {
        error += '\t\tone lowercase character\n';
      }
      if (!hasDigit.hasMatch(password)) error += '\t\tone number\n';
      if (!hasPunct.hasMatch(password)) error += '\t\tone special character\n';
      return error;
    } else {
      return "";
    }
  }

  /// Examine a [String] to see if it is the same as the password [String]
  /// Takes two [String]s - confirmPassword and password and returns a [String] - result.
  static String validateConfirmPassword(
      String? confirmPassword, String? password) {
    if (confirmPassword!.isEmpty) {
      return "Please enter a value for 'Confirm Password'.\n";
    } else if (confirmPassword.compareTo(password!) != 0) {
      return "'Confirm Password' does not match with 'Password'.\n";
    } else {
      return "";
    }
  }
}
