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
}
