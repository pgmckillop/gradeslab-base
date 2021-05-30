import 'package:hive/hive.dart';

part 'unit_grade.g.dart';

@HiveType(typeId: 0)
class UnitGrade extends HiveObject {
  @HiveField(0)
  String unitId;
  @HiveField(1)
  String unitName;
  @HiveField(2)
  String ac1grade;
  @HiveField(3)
  String ac2grade;
  @HiveField(4)
  String ac3grade;
  @HiveField(5)
  String ac4grade;
  @HiveField(6)
  String ac5grade;

  UnitGrade({this.unitId, this.unitName, this.ac1grade, this.ac2grade, this.ac3grade, this.ac4grade, this.ac5grade});

  // -- Grade display methods
  // -- Displays PD, PW , DF etc
  String gradeShortWithStatus(String ac) {
    return ac.substring(0, 2).trim();
  }

  String gradeStatus(String ac) {
    return ac.substring(1, 2).trim();
  }

  // -- Displays P, M D
  String gradeBaseLevelOnly(String ac) {
    return ac.substring(0, 1).trim();
  }

  // -- For use in the
  String gradeInfoString() {
    return "AC1: " +
        gradeShortWithStatus(ac1grade) +
        " | " +
        "AC2: " +
        gradeShortWithStatus(ac2grade) +
        " | " +
        "AC3: " +
        gradeShortWithStatus(ac3grade) +
        " | " +
        "AC4: " +
        gradeShortWithStatus(ac4grade) +
        " | " +
        "AC5: " +
        gradeShortWithStatus(ac5grade);
  }

  int criteriaPoints(String unitId, String ac) {
    int tempPoints = 0;
    String checkUnitId = "B2";

    switch (gradeBaseLevelOnly(ac)) {
      case 'P':
        {
          unitId != checkUnitId ? tempPoints += 1 : tempPoints += 3;
        }
        break;
      case 'M':
        {
          unitId != checkUnitId ? tempPoints += 2 : tempPoints += 6;
        }
        break;
      case 'D':
        {
          unitId != checkUnitId ? tempPoints += 3 : tempPoints += 9;
        }
        break;
      default:
        tempPoints += 0;
        break;
    }

    return tempPoints;
  }

  int totalUnitGradePoints() {
    var tempPoints = 0;

    tempPoints += criteriaPoints(this.unitId, ac1grade);
    tempPoints += criteriaPoints(this.unitId, ac2grade);
    tempPoints += criteriaPoints(this.unitId, ac3grade);
    tempPoints += criteriaPoints(this.unitId, ac4grade);
    tempPoints += criteriaPoints(this.unitId, ac5grade);

    return tempPoints;
  }
}
