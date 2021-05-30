/* -- GradeValidator
*
* Purpose: to determine if a candidate can reach a specific grade
* from their current position.
* The CORE data items
* targetCoursePoints - source: course_data
*
* finalisedPoints - source: examine each stored grade
* if char[1] == 'F', calculate points based on char[0]
*
* availablePoints - source if not finalised above
* accumulate points for char[0] as 'D'
* dependent on unit, B2 is different
*
* */

import '../uidata/course_data.dart';
import '../models/unit_grade.dart';
import 'package:grades_lab_hive_getx/boxes.dart';
import '../utils/grades_manager.dart';

class TargetValidator {
  // int availablePoints;
  // int finalisedPoints;
  int unitGradePoints;
  int targetProfilePoints;

  // String checkChar = 'F';
  // String pass = 'P';
  // String merit = 'M';
  // String distinction = 'D';

  var storage = Boxes.getGrades();
  var gradesManager = GradesManager();

  UnitGrade workingGrade;

  bool canMeetProfile() {
    return unitGradePoints >= targetProfilePoints;
  }

  int getTargetPoints(String profile) {
    return profile1080CoursePoints(profile);
  }

  int totalAvailablePoints() {
    return getGradePoints('A1') + getGradePoints('A2') + getGradePoints('B1') + getGradePoints('B2');
  }

  // -- could combine available and final
  // -- messy and obscure?
  int getGradePoints(String unitId) {
    int tempPoints = 0;
    // -- read the grade in storage
    workingGrade = gradesManager.getGrade(unitId);

    if (unitId != 'B2') {
      if (workingGrade.gradeStatus(workingGrade.ac1grade) == 'F') {
        switch (workingGrade.gradeBaseLevelOnly(workingGrade.ac1grade)) {
          case ('P'):
            tempPoints += 1;
            break;
          case ('M'):
            tempPoints += 2;
            break;
          case ('D'):
            tempPoints += 3;
            break;
          default:
            break;
        }
      } else
        tempPoints += 3;

      if (workingGrade.gradeStatus(workingGrade.ac2grade) == 'F') {
        switch (workingGrade.gradeBaseLevelOnly(workingGrade.ac2grade)) {
          case ('P'):
            tempPoints += 1;
            break;
          case ('M'):
            tempPoints += 2;
            break;
          case ('D'):
            tempPoints += 3;
            break;
          default:
            break;
        }
      } else
        tempPoints += 3;

      if (workingGrade.gradeStatus(workingGrade.ac3grade) == 'F') {
        switch (workingGrade.gradeBaseLevelOnly(workingGrade.ac3grade)) {
          case ('P'):
            tempPoints += 1;
            break;
          case ('M'):
            tempPoints += 2;
            break;
          case ('D'):
            tempPoints += 3;
            break;
          default:
            break;
        }
      } else
        tempPoints += 3;

      if (workingGrade.gradeStatus(workingGrade.ac4grade) == 'F') {
        switch (workingGrade.gradeBaseLevelOnly(workingGrade.ac4grade)) {
          case ('P'):
            tempPoints += 1;
            break;
          case ('M'):
            tempPoints += 2;
            break;
          case ('D'):
            tempPoints += 3;
            break;
          default:
            break;
        }
      } else
        tempPoints += 3;

      if (workingGrade.gradeStatus(workingGrade.ac5grade) == 'F') {
        switch (workingGrade.gradeBaseLevelOnly(workingGrade.ac5grade)) {
          case ('P'):
            tempPoints += 1;
            break;
          case ('M'):
            tempPoints += 2;
            break;
          case ('D'):
            tempPoints += 3;
            break;
          default:
            break;
        }
      } else
        tempPoints += 3;
    } else {
      if (workingGrade.gradeStatus(workingGrade.ac1grade) == 'F') {
        switch (workingGrade.gradeBaseLevelOnly(workingGrade.ac1grade)) {
          case ('P'):
            tempPoints += 3;
            break;
          case ('M'):
            tempPoints += 6;
            break;
          case ('D'):
            tempPoints += 9;
            break;
          default:
            break;
        }
      } else
        tempPoints += 9;

      if (workingGrade.gradeStatus(workingGrade.ac2grade) == 'F') {
        switch (workingGrade.gradeBaseLevelOnly(workingGrade.ac2grade)) {
          case ('P'):
            tempPoints += 3;
            break;
          case ('M'):
            tempPoints += 6;
            break;
          case ('D'):
            tempPoints += 9;
            break;
          default:
            break;
        }
      } else
        tempPoints += 9;

      if (workingGrade.gradeStatus(workingGrade.ac3grade) == 'F') {
        switch (workingGrade.gradeBaseLevelOnly(workingGrade.ac3grade)) {
          case ('P'):
            tempPoints += 3;
            break;
          case ('M'):
            tempPoints += 6;
            break;
          case ('D'):
            tempPoints += 9;
            break;
          default:
            break;
        }
      } else
        tempPoints += 9;

      if (workingGrade.gradeStatus(workingGrade.ac4grade) == 'F') {
        switch (workingGrade.gradeBaseLevelOnly(workingGrade.ac4grade)) {
          case ('P'):
            tempPoints += 3;
            break;
          case ('M'):
            tempPoints += 6;
            break;
          case ('D'):
            tempPoints += 9;
            break;
          default:
            break;
        }
      } else
        tempPoints += 9;

      if (workingGrade.gradeStatus(workingGrade.ac5grade) == 'F') {
        switch (workingGrade.gradeBaseLevelOnly(workingGrade.ac5grade)) {
          case ('P'):
            tempPoints += 3;
            break;
          case ('M'):
            tempPoints += 6;
            break;
          case ('D'):
            tempPoints += 9;
            break;
          default:
            break;
        }
      } else
        tempPoints += 9;
    }

    return tempPoints;
  }
}
