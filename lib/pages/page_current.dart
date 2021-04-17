import 'package:flutter/material.dart';

class PageCurrent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          'CURRENT GRADES',
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
