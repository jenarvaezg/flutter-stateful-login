import 'package:flutter/material.dart';
import '../blocs/login_bloc_provider.dart';

class BLoCLoginScreen extends StatelessWidget {
  BLoCLoginScreen({Key key}) : super(key: key);

  final String title = 'Log me in with a BLoC!';

  Widget emailField(BuildContext context) {
    final loginBloc = LoginProvider.of(context);
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

  Widget passwordField(BuildContext context) {
    final loginBloc = LoginProvider.of(context);
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

  Widget submitButton(BuildContext context) {
    return RaisedButton(
      child: Text('Submit'),
      color: Colors.blueAccent,
      onPressed: () {},
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
