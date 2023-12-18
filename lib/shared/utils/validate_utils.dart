import 'package:get/get.dart';

class ValidateUtils {
  static String? validateEmail(String? input) {
    if (input == null) {
      return 'Email không được rỗng';
    } else {
      if (input.isEmpty) {
        return 'Email không được rỗng';
      } else if (!GetUtils.isEmail(input)) {
        return 'Email không hợp lệ';
      }
    }
    return null;
  }

  static String? validatePassword(String? input) {
    if (input == null) {
      return 'Mật khẩu không được rỗng';
    } else {
      if (input.isEmpty) {
        return 'Mật khẩu không được rỗng';
      }
    }
    return null;
  }
}
