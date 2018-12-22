import 'package:flutter/material.dart';
import 'package:flutter_login_poc/blocs/login_bloc.dart';

class LoginProvider extends InheritedWidget {
  final LoginBloc _bloc = LoginBloc();

  LoginProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LoginProvider)
            as LoginProvider)
        ._bloc;
  }
}
