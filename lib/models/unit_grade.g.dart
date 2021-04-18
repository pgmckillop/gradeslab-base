// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_grade.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnitGradeAdapter extends TypeAdapter<UnitGrade> {
  @override
  final int typeId = 0;

  @override
  UnitGrade read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UnitGrade()
      ..unitId = fields[0] as String
      ..unitName = fields[1] as String
      ..ac1grade = fields[2] as String
      ..ac2grade = fields[3] as String
      ..ac3grade = fields[4] as String
      ..ac4grade = fields[5] as String
      ..ac5grade = fields[6] as String;
  }

  @override
  void write(BinaryWriter writer, UnitGrade obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.unitId)
      ..writeByte(1)
      ..write(obj.unitName)
      ..writeByte(2)
      ..write(obj.ac1grade)
      ..writeByte(3)
      ..write(obj.ac2grade)
      ..writeByte(4)
      ..write(obj.ac3grade)
      ..writeByte(5)
      ..write(obj.ac4grade)
      ..writeByte(6)
      ..write(obj.ac5grade);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is UnitGradeAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
