import 'package:flutter/material.dart';
import 'package:flutter_login_poc/blocs/login_bloc_provider.dart';
import 'package:flutter_login_poc/screens/bloc_login_screen.dart';
import 'package:flutter_login_poc/screens/stateful_login_screen.dart';

class HomeScreen extends StatelessWidget {
  Widget pageChangeButton(BuildContext context, Widget page, Widget child) {
    return ButtonTheme(
      minWidth: 150.0,
      child: RaisedButton(
        color: Colors.blue,
        onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page,
              ),
            ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a login screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            pageChangeButton(
              context,
              StatefulLoginScreen(),
              Text('Go to Stateful Login'),
            ),
            pageChangeButton(
              context,
              LoginProvider(
                child: BLoCLoginScreen(),  
              ),
              Text('Go to BLoC Login'),
            ),
          ],
        ),
      ),
    );
  }
}
