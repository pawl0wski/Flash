import 'package:flash/utils/game_repository/init_game_repository.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';

Future<void> main() async {
  await initRepositories();
  runApp(const FlashApp());
}

Future<void> initRepositories() async {
  Hive.initFlutter();

  await initGameRepository();
}
