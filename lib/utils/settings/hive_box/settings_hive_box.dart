import 'package:flash/utils/hive_box/hive_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/settings.dart';

class SettingsHiveBox extends HiveBox {
  static Box<Settings>? _settingsBox;
  final HiveInterface _hive;

  SettingsHiveBox({HiveInterface? hive}) : _hive = hive ?? Hive;

  @override
  Box get box {
    _settingsBox ??= _hive.box("settings");
    return SettingsHiveBox._settingsBox!;
  }

  @override
  void resetBox() {
    _settingsBox = null;
  }
}
