import 'package:flutter/material.dart';
import 'package:grades_lab_hive_getx/utils/explanation_messages.dart';
import '../models/target_state.dart';
import 'package:get/get.dart';
//import '../utils/explanation_messages.dart';

class PageExplanation extends StatefulWidget {
  const PageExplanation({Key key}) : super(key: key);

  @override
  _PageExplanationState createState() => _PageExplanationState();
}

class _PageExplanationState extends State<PageExplanation> {
  TargetState passedState = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.of(context).pop();
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            passedState.status == 'can_meet'
                ? Container(
                    child: Image(
                      height: MediaQuery.of(context).size.height / 6.0,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/teacher640.jpg'),
                    ),
                  )
                : Container(
                    child: Image(
                      height: MediaQuery.of(context).size.height / 6.0,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/disappointed640.jpg'),
                    ),
                  ),
            // Container(
            //   child: Image(
            //     height: MediaQuery.of(context).size.height / 6.0,
            //     width: double.infinity,
            //     fit: BoxFit.contain,
            //     image: AssetImage('assets/images/teacher640.jpg'),
            //   ),
            // ),
            SizedBox(
              height: 20.0,
            ),
            passedState.status == 'can_meet'
                ? buildBrilliantHeader(passedState.pointsDifference)
                : buildNotSoGoodHeader(passedState.pointsDifference),

            SizedBox(
              height: 10.0,
            ),
            buildWhatDoesItMean(),
            SizedBox(
              height: 10.0,
            ),
            passedState.status == 'can_meet'
                ? buildBrilliantExplanation(passedState.pointsDifference)
                : buildNotSoGoodExplanation(passedState.pointsDifference),
          ],
        ),
      ),
    );
  }

  Widget buildBrilliantHeader(int difference) => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'You can get to the target and you have $difference points to spare',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
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

  Widget buildBrilliantExplanation(int difference) => Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                'The target calculations are based on predicting that all criteria '
                'that are not marked \'final\' can achieve a Distinction grade.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Because you have $difference points to spare, '
                'you don\'t have to get a Distinction in everything. '
                'You can \'use up\' those points to reduce the grades in those criteria still to be marked as final.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'The Course Handbook outlines all the course points values of the Pass and Merit '
                'levels for the units of the course.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      );
}
