import 'package:equatable/equatable.dart';
import 'package:flash/utils/repository/mixins/object_with_uuid.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'game.g.dart';

@HiveType(typeId: 0)
class Game extends HiveObject with EquatableMixin, ObjectWithUuid {
  @HiveField(1)
  late String name;

  @HiveField(2)
  late String processName;

  @HiveField(3)
  late String workingDirectory;

  @HiveField(4)
  late String? displayUuid;

  Game(
      {required this.name,
      required this.processName,
      required this.workingDirectory});

  @override
  List<Object?> get props =>
      [uuid, name, processName, workingDirectory, displayUuid];
}
