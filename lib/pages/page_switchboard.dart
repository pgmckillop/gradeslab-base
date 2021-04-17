import 'package:flutter/material.dart';

class PageSwitchboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          'OPTIONS',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
