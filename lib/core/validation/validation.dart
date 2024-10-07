import 'package:doen/core/data/all_key.dart';

class InputValidation {
  static String validate(String value, String keyValidate) {
    String validate = null;

    if (keyValidate == ValidationKey.name) {
      if (value.isEmpty) {
        validate = "Name cannot be empty";
      }
    } else if (keyValidate == ValidationKey.username) {
      if (value.isEmpty) {
        validate = "Username cannot be empty";
      }
    } else if (keyValidate == ValidationKey.email) {
      if (value.isEmpty) {
        validate = "Email cannot be empty";
      } else if (!value.contains("@")) {
        validate = "Please make sure the correct email";
      }
    } else if (keyValidate == ValidationKey.password) {
      if (value.isEmpty) {
        validate = "Password cannot be empty";
      } else {
        if (value.length < 8) {
          validate = "Password must be least 8 character";
        }
      }
    } else {}

    return validate;
  }
}
