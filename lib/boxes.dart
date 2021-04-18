import 'package:hive/hive.dart';
import 'models/unit_grade.dart';

class Boxes {
  static Box<UnitGrade> getGrades() => Hive.box<UnitGrade>('gradesBox');
}
