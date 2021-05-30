// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flags.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FlagsAdapter extends TypeAdapter<Flags> {
  @override
  final int typeId = 1;

  @override
  Flags read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Flags(
      fields[0] as bool,
      fields[1] as bool,
      fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Flags obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.registered)
      ..writeByte(1)
      ..write(obj.firstUse)
      ..writeByte(2)
      ..write(obj.defaultGradesSet);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is FlagsAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
