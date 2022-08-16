import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'game.g.dart';

@HiveType(typeId: 0)
class Game extends HiveObject with EquatableMixin {
  @HiveField(0, defaultValue: "")
  String uuid = "";

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String processName;

  Game({required this.name, required this.processName});

  @override
  List<Object> get props => [uuid, name, processName];
}
