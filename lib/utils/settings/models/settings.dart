import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'settings.g.dart';

@HiveType(typeId: 3)
class Settings extends HiveObject with EquatableMixin {
  @HiveField(0)
  String? selectedMonitor;

  @HiveField(1)
  List<String> availableMonitors = [];

  @HiveField(2)
  bool useAllMonitors;

  @HiveField(3, defaultValue: 15)
  int checkGameTimeout;

  Settings(
      {this.selectedMonitor,
      required this.availableMonitors,
      required this.useAllMonitors,
      required this.checkGameTimeout});

  static createDefault() {
    return Settings(
        availableMonitors: [], useAllMonitors: false, checkGameTimeout: 15);
  }

  @override
  List<Object?> get props =>
      [selectedMonitor, availableMonitors, useAllMonitors];
}
