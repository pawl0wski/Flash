import 'package:hive_flutter/hive_flutter.dart';

part 'game.g.dart';

@HiveType(typeId: 0)
class Game {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String processName;
}
