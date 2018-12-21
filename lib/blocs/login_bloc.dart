import 'dart:async';

import 'package:flutter_login_poc/mixins/validation_mixin.dart';

class LoginBloc with ValidationMixin {
  final StreamController _emailController = StreamController<String>();
  final StreamController _passwordController = StreamController<String>();


  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(validateEmailTransformer);
  Stream<String> get password => _passwordController.stream.transform(validatePasswordTransformer);

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}