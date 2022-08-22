import 'package:flash/utils/repository/models/rgb.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/display.dart';
import 'models/game.dart';

Future<void> initGameRepository() async {
  Hive.registerAdapter(GameAdapter());
  Hive.registerAdapter(DisplayAdapter());
  Hive.registerAdapter(RGBAdapter());

  await Hive.openBox<Game>("games");
  await Hive.openBox<Display>("displays");
}
