import 'package:flash/utils/settings/models/settings.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initSettings() async {
  Hive.registerAdapter(SettingsAdapter());

  await Hive.openBox<Settings>("settings");
}
