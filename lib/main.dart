import 'package:flash/utils/config_directory/config_directory.dart';
import 'package:flash/utils/game_repository/init_game_repository.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';

Future<void> main() async {
  var configDirectory = await initConfigDirectory();
  await initRepositories(configDirectory: configDirectory);
  runApp(const FlashApp());
}

Future<void> initRepositories(
    {required ConfigDirectory configDirectory}) async {
  await Hive.initFlutter(configDirectory.path);

  await initGameRepository();
}

Future<ConfigDirectory> initConfigDirectory() async {
  var configDirectory = ConfigDirectory(appName: 'Flash');
  await configDirectory.createDirectoryIfNotExists();
  return configDirectory;
}
