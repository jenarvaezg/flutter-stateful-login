import 'package:flutter/material.dart';
import 'package:flutter_login_poc/mixins/validation_mixin.dart';

class StatefulLoginScreen extends StatefulWidget {
  StatefulLoginScreen({Key key}) : super(key: key);

  final String title = 'Log me in with a StatefulWidget!';

  @override
  _StatefulLoginScreenState createState() => _StatefulLoginScreenState();
}

class _StatefulLoginScreenState extends State<StatefulLoginScreen> with ValidationMixin {
  FocusNode _emailFocusNode;
  FocusNode _passwordFocusNode;
  String _email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  Widget emailField(BuildContext context) {
    return TextFormField(
      autofocus: true,
      focusNode: _emailFocusNode,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        hintText: 'you@example.com',
        labelText: 'Email Address',
      ),
      onFieldSubmitted: (_) =>
          FocusScope.of(context).requestFocus(_passwordFocusNode),
      validator: validateEmail,
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget passwordField(BuildContext context)  {
    return TextFormField(
      focusNode: _passwordFocusNode,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        hintText: '******',
        labelText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget submitButton(BuildContext context) {
    return RaisedButton(
      child: Text('Submit'),
      color: Colors.blueAccent,
      onPressed: () {
        if(_formKey.currentState.validate()) {
          _formKey.currentState.save();
          print('Going to save $_email and $_password');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              emailField(context),
              passwordField(context),
              Container(margin: EdgeInsets.only(bottom: 25)),
              submitButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
