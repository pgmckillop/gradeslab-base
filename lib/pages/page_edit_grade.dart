import 'package:flutter/material.dart';
import '../models/unit_grade.dart';
import 'package:get/get.dart';

import '../widgets/dropdown_wrapper.dart';
import '../widgets/dropdown_control.dart';

import '../uidata/course_data.dart';

import 'package:grades_lab_hive_getx/boxes.dart';

class PageEditGrade extends StatefulWidget {
  @override
  _PageEditGradeState createState() => _PageEditGradeState();
}

class _PageEditGradeState extends State<PageEditGrade> {
  final formKey = GlobalKey<FormState>();

  // -- Create object to hold data passed from PageCurrent()
  UnitGrade gradeToEdit = Get.arguments;

  // -- local data variables
  String _ac1 = 'PW Working at Pass' ?? '';
  String _ac2 = 'PW Working at Pass' ?? '';
  String _ac3 = 'PW Working at Pass' ?? '';
  String _ac4 = 'PW Working at Pass' ?? '';
  String _ac5 = 'PW Working at Pass' ?? '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // -- these will populate the current values to the dropdowns
    // _ac1 = gradeToEdit.ac1grade;
    // _ac2 = gradeToEdit.ac2grade;
    // _ac3 = gradeToEdit.ac3grade;
    // _ac4 = gradeToEdit.ac4grade;
    // _ac5 = gradeToEdit.ac5grade;
  }

  @override
  Widget build(BuildContext context) {
    bool containsFinalGrade = false;

    String gradeId = gradeToEdit.unitId;

    String currentGradeString = gradeToEdit.gradeInfoString();

    if (gradeToEdit.gradeStatus(gradeToEdit.ac1grade) == 'F') {
      containsFinalGrade = true;
    } else if (gradeToEdit.gradeStatus(gradeToEdit.ac2grade) == 'F') {
      containsFinalGrade = true;
    } else if (gradeToEdit.gradeStatus(gradeToEdit.ac3grade) == 'F') {
      containsFinalGrade = true;
    } else if (gradeToEdit.gradeStatus(gradeToEdit.ac4grade) == 'F') {
      containsFinalGrade = true;
    } else if (gradeToEdit.gradeStatus(gradeToEdit.ac5grade) == 'F') {
      containsFinalGrade = true;
    } else {
      containsFinalGrade = false;
    }

    final box = Boxes.getGrades();
    UnitGrade gradeToWrite = UnitGrade();
    // TODO: Remove Debug messages
    //print('Passed grade from object is ${gradeToEdit.unitId}');
    //print('Passed ac1 from variable is $_ac1');
    //
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
          'EDIT GRADE $gradeId',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Current module grades for $gradeId',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                currentGradeString,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Select the criteria grades',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              buildAC1Dropdown(),
              SizedBox(
                height: 8.0,
              ),
              buildAC2Dropdown(),
              SizedBox(
                height: 8.0,
              ),
              buildAC3Dropdown(),
              SizedBox(
                height: 8.0,
              ),
              buildAC4Dropdown(),
              SizedBox(
                height: 8.0,
              ),
              buildAC5Dropdown(),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  // -- Handle overwrite of final grades
                  if (containsFinalGrade) {
                    print('Final grade trapped');
                    Get.defaultDialog(
                      title: 'Are you sure?',
                      content: Text('This action will overwrite a grade marked as a final award'),
                      textCancel: 'No',
                      textConfirm: 'Yes',
                      backgroundColor: Colors.yellow,
                      onCancel: () {},
                      onConfirm: () {
                        gradeToWrite.unitId = gradeToEdit.unitId;
                        gradeToWrite.unitName = gradeToEdit.unitName;
                        gradeToWrite.ac1grade = _ac1;
                        gradeToWrite.ac2grade = _ac2;
                        gradeToWrite.ac3grade = _ac3;
                        gradeToWrite.ac4grade = _ac4;
                        gradeToWrite.ac5grade = _ac5;
                        // -- Write to Db
                        box.put(gradeToWrite.unitId, gradeToWrite);

                        // -- go to PageCurrent
                        Get.toNamed('/current');
                      },
                    );
                  } else {
                    gradeToWrite.unitId = gradeToEdit.unitId;
                    gradeToWrite.unitName = gradeToEdit.unitName;
                    gradeToWrite.ac1grade = _ac1;
                    gradeToWrite.ac2grade = _ac2;
                    gradeToWrite.ac3grade = _ac3;
                    gradeToWrite.ac4grade = _ac4;
                    gradeToWrite.ac5grade = _ac5;
                    // -- Write to Db
                    box.put(gradeToWrite.unitId, gradeToWrite);

                    // -- go to PageCurrent
                    Get.toNamed('/current');
                  }

                  // gradeToWrite.unitId = gradeToEdit.unitId;
                  // gradeToWrite.unitName = gradeToEdit.unitName;
                  // gradeToWrite.ac1grade = _ac1;
                  // gradeToWrite.ac2grade = _ac2;
                  // gradeToWrite.ac3grade = _ac3;
                  // gradeToWrite.ac4grade = _ac4;
                  // gradeToWrite.ac5grade = _ac5;
                  // // -- Write to Db
                  // box.put(gradeToWrite.unitId, gradeToWrite);
                  //
                  // // -- go to PageCurrent
                  // Get.toNamed('/current');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 60.0),
                  alignment: Alignment.center,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Submit Updates',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -- Dropdown controls
  Widget buildAC1Dropdown() => Container(
        child: DropdownWrapper(
          acLabel: 'AC1',
          flexValue1: 2,
          flexValueChild: 5,
          wrapperChild: DropdownControl(
            hintText: 'Choose your grade',
            valueSetter: _ac1,
            items: getCriteriaGradeDropdownItems(),
            onChange: (newValue) {
              setState(() {
                this._ac1 = newValue;
              });
            },
          ),
        ),
      );

  Widget buildAC2Dropdown() => Container(
        child: DropdownWrapper(
          acLabel: 'AC2',
          flexValue1: 2,
          flexValueChild: 5,
          wrapperChild: DropdownControl(
            hintText: 'Choose your grade',
            valueSetter: _ac2,
            items: getCriteriaGradeDropdownItems(),
            onChange: (newValue) {
              setState(() {
                this._ac2 = newValue;
              });
            },
          ),
        ),
      );

  Widget buildAC3Dropdown() => Container(
        child: DropdownWrapper(
          acLabel: 'AC3',
          flexValue1: 2,
          flexValueChild: 5,
          wrapperChild: DropdownControl(
            hintText: 'Choose your grade',
            valueSetter: _ac3,
            items: getCriteriaGradeDropdownItems(),
            onChange: (newValue) {
              setState(() {
                this._ac3 = newValue;
              });
            },
          ),
        ),
      );

  Widget buildAC4Dropdown() => Container(
        child: DropdownWrapper(
          acLabel: 'AC4',
          flexValue1: 2,
          flexValueChild: 5,
          wrapperChild: DropdownControl(
            hintText: 'Choose your grade',
            valueSetter: _ac4,
            items: getCriteriaGradeDropdownItems(),
            onChange: (newValue) {
              setState(() {
                this._ac4 = newValue;
              });
            },
          ),
        ),
      );

  Widget buildAC5Dropdown() => Container(
        child: DropdownWrapper(
          acLabel: 'AC5',
          flexValue1: 2,
          flexValueChild: 5,
          wrapperChild: DropdownControl(
            hintText: 'Choose your grade',
            valueSetter: _ac5,
            items: getCriteriaGradeDropdownItems(),
            onChange: (newValue) {
              setState(() {
                this._ac5 = newValue;
              });
            },
          ),
        ),
      );
}

//

//

//
///
///
///
///
///

// }
