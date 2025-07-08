import 'package:pokedex_app/core/constants/strings.dart';

class ErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is String) {
      return error;
    }
    return AppStrings.errorSomethingWentWrong;
  }
}
