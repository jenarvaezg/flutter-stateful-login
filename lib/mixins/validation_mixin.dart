import 'dart:async';

class ValidationMixin {
  String validateEmail(String value) {
    final emailValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    return emailValid ? null : "Invalid email address";
  }

  get validateEmailTransformer => StreamTransformer<String, String>.fromHandlers(
    handleData: (String value, EventSink<String> sink) {
      final errorText = validateEmail(value);
      if (errorText == null) {
        sink.add(value);
      } else {
        sink.addError(errorText);
      }
    }
  );

  String validatePassword(String value) {
    return value.length >= 8 ? null : "Password must have at least 8 characters";
  }

  get validatePasswordTransformer => StreamTransformer<String, String>.fromHandlers(
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
