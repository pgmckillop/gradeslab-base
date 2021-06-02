// TODO: Dropdown Trailing edit icon
import '../models/unit_grade.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:grades_lab_hive_getx/boxes.dart';

import '../utils/performance_report.dart';

class PageCurrent extends StatelessWidget {
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
          'CURRENT GRADES',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
        // TODO: Remove link to PageTestbed when appropriate
        // actions: [
        //   IconButton(
        //     icon: const Icon(
        //       Icons.add_to_home_screen,
        //       color: Colors.blue,
        //     ),
        //     onPressed: () {
        //       Get.toNamed('/explanation');
        //     },
        //   ),
        // ],
      ),
      body: ValueListenableBuilder<Box<UnitGrade>>(
        valueListenable: Boxes.getGrades().listenable(),
        builder: (context, box, _) {
          final unitGrades = box.values.toList().cast<UnitGrade>();
          return buildContent(unitGrades); // --- buildContent Widget
        },
      ),
    );
  }

  Widget buildContent(List<UnitGrade> unitGrades) {
    if (unitGrades.isEmpty) {
      return Center(
        child: Text(
          'No grades stored',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      );
    } else {
      // -- TOTAL Points
      final totalPoints = unitGrades.fold<int>(
        0,
        (previousValue, unitGrade) => previousValue + unitGrade.totalUnitGradePoints(),
      );

      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //-- total points somewhere
          Expanded(
            flex: 2,
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: unitGrades.length,
              itemBuilder: (BuildContext context, int index) {
                final unitGrade = unitGrades[index];
                return buildGrade(context, unitGrade);

                //return buildGradeDataTile(context, unitGrade);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: buildPerformanceReport(totalPoints),
          ),
        ],
      );
    }
  }

  Widget buildGradeDataTile(
    BuildContext context,
    UnitGrade unitGrade,
  ) {
    final gradeTitle = unitGrade.unitName;
    final gradesString = unitGrade.gradeInfoString();
    final gradePoints = unitGrade.totalUnitGradePoints().toString();

    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        leading: Text(
          gradePoints,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        title: Column(
          children: [
            Text(
              gradeTitle,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(gradesString),
          ],
        ),
        trailing: Row(
          children: [
            buildButtons(context, unitGrade),
          ],
        ),
      ),
    );
  }

  // -- Local widgets
  Widget buildGrade(
    BuildContext context,
    UnitGrade unitGrade,
  ) {
    final gradeTitle = unitGrade.unitName;
    final gradesString = unitGrade.gradeInfoString();
    final gradePoints = unitGrade.totalUnitGradePoints().toString();
    // TODO: Remove debug message
    // print('Built the grade ${unitGrade.unitId.toString()}');

    return Card(
      color: Colors.lightBlue,
      // -- Row here? Change to ListTile
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        title: Text(
          gradeTitle,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            gradesString,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        // -- Wrap with Row containing the text and the edit button
        trailing: Text(
          gradePoints,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        // -- remove the children underneath
        children: [
          buildButtons(context, unitGrade),
        ],
      ),
    );
  }

  Widget buildButtons(BuildContext context, UnitGrade unitGrade) {
    return IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          // TODO: Remove debug message
          //print('The UnitGrade Id is: ${unitGrade.unitId}');
          //unitGrade != null ? print('We found the unitGrade object') : print('We have not got the unitGrade object');
          Get.toNamed('/edit', arguments: unitGrade);

          //
          //
          // TODO: Remove debug messages
          //print(unitGrade.unitId);
          //Get.toNamed('/edit', arguments: unitGrade);
        });
  }

  // -- Bottom of screen performance overview
  Widget buildPerformanceReport(int points) {
    // -- Data
    PerformanceReport performance = PerformanceReport();
    var profile = performance.getProfile(points);

    final String profileAchieved = profile.profileName;
    final String ucasEarned = profile.ucasValue.toString();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO: Extract Container to widget with paramweter for Text value
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.teal,
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Text(
                'Total Course Points: $points',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.teal,
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Text(
                'Grade Profile: $profileAchieved',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.teal,
              border: Border.all(
                color: Colors.blue,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Text(
                'UCAS Points Value: $ucasEarned',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
