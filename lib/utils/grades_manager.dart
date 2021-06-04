import '../models/unit_grade.dart';
import 'package:grades_lab_hive_getx/boxes.dart';

class GradesManager {
  Future addGrade(
    String id,
    String name,
    String ac1,
    String ac2,
    String ac3,
    String ac4,
    String ac5,
  ) async {
    final unitGrade = UnitGrade()
      ..unitId = id
      ..unitName = name
      ..ac1grade = ac1
      ..ac2grade = ac2
      ..ac3grade = ac3
      ..ac4grade = ac4
      ..ac5grade = ac5;

    final box = Boxes.getGrades();
    box.put(id, unitGrade);
  }

  // -- for persisting a known UnitGrade
  // Future addPopulatedGrade(UnitGrade grade) {
  //   final box = Boxes.getGrades();
  //   box.put(grade.unitId.toString().trim(), grade);
  // }

  void deleteUnitGrade(UnitGrade grade) {
    final box = Boxes.getGrades();
    box.delete(grade.unitId);
  }

  UnitGrade getGrade(String id) {
    final box = Boxes.getGrades();
    return box.get(id);
  }

  void editGrade(UnitGrade unitGrade, id, String name, String ac1, String ac2, String ac3, String ac4, String ac5) {
    // -- Resolve method with Milke code.
    unitGrade.unitId = id;
    unitGrade.unitName = name;
    unitGrade.ac1grade = ac1;
    unitGrade.ac2grade = ac2;
    unitGrade.ac3grade = ac3;
    unitGrade.ac4grade = ac4;
    unitGrade.ac5grade = ac5;

    // -- overwrite method
    final box = Boxes.getGrades();
    //box.put(id, unitGrade);

    box.delete('id');

    // -- reserve for use
    unitGrade.save();
  }
}
