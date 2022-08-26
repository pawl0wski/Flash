import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'settings.g.dart';

@HiveType(typeId: 3)
class Settings extends HiveObject with EquatableMixin {
  @HiveField(0)
  String? screenToChangeDisplay;

  @HiveField(1)
  List<String> availableScreens = [];

  @HiveField(2)
  bool useAllScreens;

  Settings(
      {this.screenToChangeDisplay,
      required this.availableScreens,
      required this.useAllScreens});

  static createDefault() {
    return Settings(availableScreens: [], useAllScreens: false);
  }

  @override
  List<Object?> get props => [];
}
