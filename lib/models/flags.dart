import 'package:hive/hive.dart';

part 'flags.g.dart';

@HiveType(typeId: 1)
class Flags extends HiveObject {
  @HiveField(0)
  bool registered;
  @HiveField(1)
  bool firstUse;
  @HiveField(2)
  bool defaultGradesSet;

  Flags(this.registered, this.firstUse, this.defaultGradesSet);
}
