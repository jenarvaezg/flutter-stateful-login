import 'package:flutter/material.dart';
import 'package:flutter_login_poc/blocs/login_bloc.dart';

class BLoCLoginScreen extends StatelessWidget {
  BLoCLoginScreen({Key key}) : super(key: key);

  final String title = 'Log me in with a BLoC!';
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final LoginBloc bloc = LoginBloc();
  

  Widget emailField(BuildContext context) {
    return TextField(
      autofocus: true,
      focusNode: _emailFocusNode,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'you@example.com',
        labelText: 'Email Address',
      ),
      onChanged: (String value) {
        bloc.changeEmail(value);
      },
      onSubmitted: (_) =>
          FocusScope.of(context).requestFocus(_passwordFocusNode),
    );
  }

  Widget passwordField(BuildContext context)  {
    return TextField(
      focusNode: _passwordFocusNode,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        hintText: '******',
        labelText: 'Password',
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return RaisedButton(
      child: Text('Submit'),
      color: Colors.blueAccent,
      onPressed: () {
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              emailField(context),
              passwordField(context),
              Container(margin: EdgeInsets.only(bottom: 25)),
              submitButton(context),
            ],
          ),
      ),
    );
  }
}
