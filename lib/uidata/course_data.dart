import 'package:flutter/material.dart';

const List<String> coursesList = ['1 Year Certificate 540 Hours', '2 Year Extended Diploma 1080 Hours'];

const List<String> gradeProfiles = ['PPP', 'MPP', 'MMP', 'MMM', 'DMM', 'DDM', 'DDD', 'D*DD', 'D*D*D', 'D*D*D*'];

const List<String> gradeProfiles540 = ['PP', 'MP', 'MM', 'DM', 'DD', 'D*D', 'D*D*'];

const List<String> criteriaGradesFull = [
  'NG No Grade',
  'PW Working at Pass',
  'PF Pass final awarded',
  'MW Working at Merit',
  'MF Merit final awarded',
  'DW Working at Distinction',
  'DF Distinction final awarded'
];

const List<String> courseUnits = [
  'A1 Skills Development',
  'A2 Creative Project',
  'B1 Personal Progression',
  'B2 Industry Response'
];

// -- function to return list for Dropdown of grades
//-- Grade items list
List<DropdownMenuItem> getCourseDropdownItems() {
  List<DropdownMenuItem<String>> dropDownCourseItems = [];

  for (int i = 0; i < coursesList.length; i++) {
    String grade = (coursesList[i]);
    var newUnitItem = DropdownMenuItem(
      child: Text(
        grade ?? 'default',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      value: grade,
    );

    dropDownCourseItems.add(newUnitItem);
  }

  return dropDownCourseItems;
}

List<DropdownMenuItem> getProfileDropdownItems() {
  List<DropdownMenuItem<String>> dropDownProfileItems = [];

  for (int i = 0; i < gradeProfiles.length; i++) {
    String profile = (gradeProfiles[i]);
    var newUnitItem = DropdownMenuItem(
      child: Text(
        profile ?? 'default',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      value: profile,
    );

    dropDownProfileItems.add(newUnitItem);
  }
  return dropDownProfileItems;
}

List<DropdownMenuItem> getCriteriaGradeDropdownItems() {
  List<DropdownMenuItem<String>> dropDownCriteriaGradeItems = [];

  for (int i = 0; i < criteriaGradesFull.length; i++) {
    String grade = (criteriaGradesFull[i]);
    var newUnitItem = DropdownMenuItem(
      child: Text(
        grade ?? 'default',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      value: grade,
    );

    dropDownCriteriaGradeItems.add(newUnitItem);
  }
  return dropDownCriteriaGradeItems;
}
