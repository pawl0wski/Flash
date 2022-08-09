import 'package:flash/utils/game_repository/models/game.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initGameRepository() async {
  _registerAdapterIfNotRegistered(GameAdapter());

  await Hive.openBox<Game>("games");
}

void _registerAdapterIfNotRegistered(TypeAdapter adapter) {
  if (!Hive.isAdapterRegistered(adapter.typeId)) {
    Hive.registerAdapter(adapter);
  }
}
