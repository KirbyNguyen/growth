/// [ValidatorServices] provides functions to validate [TextFormField].
class ValidatorServices {
  /// Examines a [String] to see if it is not empty.
  static String? validateEmpty(String? field) {
    if (field!.isEmpty) {
      return "Please enter a value for this field.\n";
    } else {
      return null;
    }
  }

  /// Examines a [String] to see if it is a numeric string.
  static String? validateNumeric(String? field) {
    if (field!.isEmpty) {
      return "Please enter a value for this field.\n";
    } else if (double.tryParse(field) == null) {
      return "Please enter a numeric value.";
    } else {
      return null;
    }
  }

  /// Examines a [String] to see if it is a valid username.
  static String? validateDisplayName(String? displayName) {
    if (displayName!.isEmpty) {
      return "Please enter a value for 'Display Name'.\n";
    } else {
      return null;
    }
  }


  /// Examine a [String] to see if it is a valid email.
  static String? validateEmail(String? email) {
    // Email expression
    RegExp regex = RegExp(r'\w+@\w+\.\w+');
    if (email!.isEmpty) {
      return "Please enter a value for 'Email'.\n";
    } else if (!regex.hasMatch(email)) {
      return "'Email' is badly formatted.\n";
    } else {
      return null;
    }
  }

  /// Examine a [String] to see if it is a strong password
  static String? validatePassword(String? password) {
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
      return null;
    }
  }

  /// Examine a [String] to see if it is the same as the password [String]
  static String? validateConfirmPassword(
      String? confirmPassword, String? password) {
    if (confirmPassword!.isEmpty) {
      return "Please enter a value for 'Confirm Password'.\n";
    } else if (confirmPassword.compareTo(password!) != 0) {
      return "'Confirm Password' does not match with 'Password'.\n";
    } else {
      return null;
    }
  }
}
