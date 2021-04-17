import 'package:flutter/material.dart';

class PageLogin extends StatelessWidget {
  bool loginEnabled = false;
  // read from controller to see if set to 'registered'

  final String registered = '';
  final String passcode = '';
  String enteredPasscode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: Container(),
    );
  }
}
