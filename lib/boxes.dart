import 'package:hive/hive.dart';
import 'models/unit_grade.dart';
import 'models/flags.dart';

class Boxes {
  static Box<UnitGrade> getGrades() => Hive.box<UnitGrade>('gradesBox');

  static Box<Flags> getFlags() => Hive.box<Flags>('flagsBox');
}
