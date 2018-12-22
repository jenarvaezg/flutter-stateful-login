import 'package:flutter/material.dart';
import 'package:flutter_login_poc/blocs/login_bloc.dart';
import '../blocs/login_bloc_provider.dart';

class BLoCLoginScreen extends StatelessWidget {
  BLoCLoginScreen({Key key}) : super(key: key);

  final String title = 'Log me in with a BLoC!';

  Widget emailField(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.email,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            errorText: snapshot.error,
            icon: Icon(Icons.email),
            hintText: 'you@example.com',
            labelText: 'Email Address',
          ),
          onChanged: loginBloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.password,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
            errorText: snapshot.error,
            icon: Icon(Icons.lock),
            hintText: '********',
            labelText: 'Password',
          ),
          onChanged: loginBloc.changePassword,
        );
      },
    );
  }

  Widget submitButton(LoginBloc loginBloc) {
    return StreamBuilder(
      stream: loginBloc.submitValid,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return RaisedButton(
          child: Text('Submit'),
          color: Colors.blueAccent,
          onPressed: snapshot.hasData ? loginBloc.submit : null,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    LoginBloc loginBloc = LoginProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            emailField(loginBloc),
            passwordField(loginBloc),
            Container(margin: EdgeInsets.only(bottom: 25)),
            submitButton(loginBloc),
          ],
        ),
      ),
    );
  }
}
