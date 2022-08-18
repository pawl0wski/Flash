import 'package:flash/utils/repository/hive_box/hive_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/game.dart';

class GameHiveBox extends HiveBox {
  static Box<Game>? _gameBox;

  GameHiveBox({HiveInterface? hive}) : super(hive: hive);

  @override
  void resetBox() {
    _gameBox = null;
  }

  @override
  Box<Game> get box {
    GameHiveBox._gameBox ??= hive.box("games");
    return GameHiveBox._gameBox!;
  }
}
