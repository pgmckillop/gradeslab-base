import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageExplanation extends StatefulWidget {
  const PageExplanation({Key key}) : super(key: key);

  @override
  _PageExplanationState createState() => _PageExplanationState();
}

class _PageExplanationState extends State<PageExplanation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.blue,
              ),
              onPressed: () {
                Get.toNamed('/switchboard');
              },
            );
          },
        ),
        title: Text(
          'EXPLANATION',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
