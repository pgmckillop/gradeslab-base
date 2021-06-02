import 'package:flutter/material.dart';

Widget buildBrilliantHeader(int points) => RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'You can get to the target and you have $points points to spare',
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

Widget buildBrilliantExplanation(String points) => Container(
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
              'Because you have $points points to spare, '
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
