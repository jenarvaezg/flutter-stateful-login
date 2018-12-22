import 'dart:async';

import 'package:rxdart/rxdart.dart';

import 'package:flutter_login_poc/blocs/login_validator.dart';

class LoginBloc extends Object with LoginBlocValidator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get email =>
      _emailController.stream.transform(validateEmailTransformer);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePasswordTransformer);
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  submit() {
    final email = _emailController.value;
    final password = _passwordController.value;

    print("Now I would submit $email and $password");
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
