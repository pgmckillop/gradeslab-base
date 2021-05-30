import 'package:flutter/material.dart';

const List<String> coursesList = ['1 Year Certificate 540 Hours', '2 Year Extended Diploma 1080 Hours'];

const List<String> gradeProfiles = ['PPP', 'MPP', 'MMP', 'MMM', 'DMM', 'DDM', 'DDD', 'D*DD', 'D*D*D', 'D*D*D*'];

const List<String> gradeProfiles540 = ['PP', 'MP', 'MM', 'DM', 'DD', 'D*D', 'D*D*'];

const List<String> ucasBands1080 = ['48', '64', '80', '96', '112', '128', '144', '152', '160', '168'];

const List<String> ucasBands540 = ['32', '48', '64', '80', '96', '104', '112'];

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

// -- function to return list for Dropdowns

List<DropdownMenuItem> get1080UcasDropdownItems() {
  List<DropdownMenuItem<String>> drop1080UcasItems = [];

  for (int i = 0; i < ucasBands1080.length; i++) {
    String band = (ucasBands1080[i]);
    var newBandItem = DropdownMenuItem(
      child: Text(
        band ?? 'default',
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      value: band,
    );

    drop1080UcasItems.add(newBandItem);
  }

  return drop1080UcasItems;
}

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

List<DropdownMenuItem> get1080ProfileDropdownItems() {
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

String profile1080ToUcas(String profile) {
  var tempString = '';

  switch (profile) {
    case 'PPP':
      {
        tempString = '48';
      }
      break;

    case 'MPP':
      {
        tempString = '64';
      }
      break;

    case 'MMP':
      {
        tempString = '80';
      }
      break;

    case 'MMM':
      {
        tempString = '96';
      }
      break;

    case 'DMM':
      {
        tempString = '112';
      }
      break;

    case 'DDM':
      {
        tempString = '128';
      }
      break;

    case 'DDD':
      {
        tempString = '144';
      }
      break;

    case 'D*DD':
      {
        tempString = '152';
      }
      break;

    case 'D*D*D':
      {
        tempString = '160';
      }
      break;

    case 'D*D*D*':
      {
        tempString = '168';
      }
      break;

    default:
      {
        tempString = '';
      }
      break;
  }

  return tempString;
}

String ucas1080ToProfile(String ucas) {
  var tempString = '';

  switch (ucas) {
    case '48':
      {
        tempString = 'PPP';
      }
      break;

    case '64':
      {
        tempString = 'MPP';
      }
      break;

    case '80':
      {
        tempString = 'MMP';
      }
      break;

    case '96':
      {
        tempString = 'MMM';
      }
      break;

    case '112':
      {
        tempString = 'DMM';
      }
      break;

    case '128':
      {
        tempString = 'DDM';
      }
      break;

    case '144':
      {
        tempString = 'DDD';
      }
      break;

    case '152':
      {
        tempString = 'D*DD';
      }
      break;

    case '160':
      {
        tempString = 'D*D*D';
      }
      break;

    case '168':
      {
        tempString = 'D*D*D*';
      }
      break;

    default:
      {
        tempString = '';
      }
      break;
  }

  return tempString;
}

int profile1080CoursePoints(String profile) {
  int temp = 0;

  switch (profile) {
    case 'U':
      temp = 0;
      break;
    case 'PPP':
      temp = 30;
      break;
    case 'MPP':
      temp = 36;
      break;
    case 'MMP':
      temp = 42;
      break;
    case 'MMM':
      temp = 50;
      break;
    case 'DMM':
      temp = 58;
      break;
    case 'DDM':
      temp = 64;
      break;
    case 'DDD':
      temp = 70;
      break;
    case 'D*DD':
      temp = 74;
      break;
    case 'D*D*D':
      temp = 80;
      break;
    case 'D*D*D*':
      temp = 85;
      break;
    default:
      temp = 9999;
      break;
  }

  return temp;
}
