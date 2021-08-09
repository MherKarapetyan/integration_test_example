import 'package:integration_test_example/internal/core/regexp.dart';

///
/// [Validators] class helps to centralize TextField validations in one place.
///
class Validators {
  ///
  /// * `Validators.email` function gets an email as type `String` and tries to validate
  /// based on `RegularExpressions.email` pattern. Returns message as type `String`.
  ///
  String email(String value) {
    String error = 'Invalid email';
    if (value?.isEmpty ?? true) {
      error = 'Email can\'t be empty';
    } else if (RegularExpressions.email.hasMatch(value)) {
      error = null;
    }
    return error;
  }

  ///
  /// * `Validators.password` function gets an password as type `String` and tries to validate
  /// based on `RegularExpressions.password` pattern. Returns message as type `String`.
  ///
  String password(String value) {
    String error = 'Invalid password.';
    if (value?.isEmpty ?? true) {
      error = 'Password can\'t be empty';
    } else if (RegularExpressions.password.hasMatch(value)) {
      error = null;
    }

    return error;
  }
}
