import 'package:flash/scanner/apps_scanner.dart';
import 'package:flash/system_tray/init_system_tray.dart';
import 'package:flash/utils/config_directory/config_directory.dart';
import 'package:flash/utils/default_displays_creator/default_displays_creator.dart';
import 'package:flash/utils/repository/init_repositories.dart';
import 'package:flash/utils/settings/init_settings.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';

Future<void> main() async {
  var configDirectory = await initConfigDirectory();
  await initRepositories(configDirectory: configDirectory);
  await initSystemTray();
  DefaultDisplaysCreator().create();
  AppsScanner().scan();
  runApp(const FlashApp());
}

Future<void> initRepositories(
    {required ConfigDirectory configDirectory}) async {
  await Hive.initFlutter(configDirectory.path);

  await initGameRepository();
  await initSettings();
}

Future<ConfigDirectory> initConfigDirectory() async {
  var configDirectory = ConfigDirectory(appName: 'Flash');
  await configDirectory.createDirectoryIfNotExists();
  return configDirectory;
}
