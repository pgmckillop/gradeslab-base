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

  Widget buildBrilliantHeader() => RichText(
        text: TextSpan(
          text: 'You can get to the target and have xx points to spare',
          style: TextStyle(
            color: Colors.green[850],
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget buildWhatDoesItMean() => RichText(
        text: TextSpan(
          text: 'So what does that mean?',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget buildBrilliantExplanation() => Container(
        child: Column(
          children: <Widget>[
            Text(
                'The target calculations are based on predicting that all criteria that are not marked final can achieve a Distinction grade.'),
            Text(
                'Because you have xx points to spare, you don\'t have to get a Distinction in everything. You can \'use up\' those points to reduce the grades in the criteria still to be marked as final. The Course Handbook outlines all the values of the Pass and Merit levels for the units of the course'),
          ],
        ),
      );
}
