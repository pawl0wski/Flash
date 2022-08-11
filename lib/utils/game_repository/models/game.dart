import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'game.g.dart';

@HiveType(typeId: 0)
class Game extends HiveObject with EquatableMixin {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String processName;

  @override
  List<Object> get props => [name, processName];
}
