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

  Settings(
      {this.selectedMonitor,
      required this.availableMonitors,
      required this.useAllMonitors});

  static createDefault() {
    return Settings(availableMonitors: [], useAllMonitors: false);
  }

  @override
  List<Object?> get props =>
      [selectedMonitor, availableMonitors, useAllMonitors];
}
