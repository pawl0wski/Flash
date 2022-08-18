import 'package:hive_flutter/hive_flutter.dart';

import 'models/display.dart';
import 'models/game.dart';

Future<void> initGameRepository() async {
  _registerAdapterIfNotRegistered(GameAdapter());
  _registerAdapterIfNotRegistered(DisplayAdapter());

  await Hive.openBox<Game>("games");
  await Hive.openBox<Display>("displays");
}

void _registerAdapterIfNotRegistered(TypeAdapter adapter) {
  if (!Hive.isAdapterRegistered(adapter.typeId)) {
    Hive.registerAdapter(adapter);
  }
}
