import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/grades_manager.dart';
import '../models/unit_grade.dart';
import '../utils/target_validator.dart';

class PageTestbed extends StatefulWidget {
  @override
  _PageTestbedState createState() => _PageTestbedState();
}

class _PageTestbedState extends State<PageTestbed> {
  GradesManager gradeManager = GradesManager();

  final a1 = 'A1 Skills Development';

  final a2 = 'A2 Creative Project';

  final b1 = 'B1 Personal Progression';

  final b2 = 'B2 Industry Response';

  final targetValidator = TargetValidator();

  @override
  Widget build(BuildContext context) {
    UnitGrade testData = UnitGrade();

    testData.unitId = 'A2';
    testData.unitName = 'A2 Creative Project';
    testData.ac1grade = 'MW Working at Merit';
    testData.ac2grade = 'MW Working at Merit';
    testData.ac3grade = 'MF Merit final awarded';
    testData.ac4grade = 'PF Pass final awarded';
    testData.ac5grade = 'DW Working at Distinction';

    int a1Points = targetValidator.getGradePoints('A1');
    int a2Points = targetValidator.getGradePoints('A2');
    int b1Points = targetValidator.getGradePoints('B1');
    int b2Points = targetValidator.getGradePoints('B2');

    int totalAvailablePoints = a1Points + a2Points + b1Points + b2Points;

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
          'Testbed',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.lightBlue,
              ),
              child: TextButton(
                onPressed: () {
                  print('Points available from Module A1: $a1Points');
                  print('Total available points from all Modules: $totalAvailablePoints');

                  //final box = Boxes.getGrades();
                  // box.delete(b1);

                  //box.put(testData.unitId.toString().trim(), testData);

                  //Boxes.getGrades();
                  //gradeManager.deleteUnitGrade(testData);
                  //gradeManager.addPopulatedGrade(testData);
                  //print('Grade ${testData.unitId} added to Db');
                },
                child: Text(
                  'Click',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
