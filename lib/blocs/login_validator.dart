import 'dart:async';

import 'package:flutter_login_poc/utils/validations.dart';

class LoginBlocValidator {
  final  validateEmailTransformer = StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink) {
      final errorText = validateEmail(value);
      if (errorText == null) {
        sink.add(value);
      } else {
        sink.addError(errorText);
      }
    }
  );

  final validatePasswordTransformer = StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink) {
      final errorText = validatePassword(value);
      if (errorText == null ) {
        sink.add(value);
      } else {
        sink.addError(errorText);
      }
    }
  );
}