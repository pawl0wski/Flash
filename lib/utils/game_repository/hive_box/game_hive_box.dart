import 'package:flash/utils/game_repository/models/game.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GameHiveBox {
  static Box<Game>? _gameBox;
  final HiveInterface _hive;

  GameHiveBox({HiveInterface? hive}) : _hive = hive ?? Hive;

  static resetBox() {
    _gameBox = null;
  }

  Box<Game> get box {
    GameHiveBox._gameBox ??= _hive.box("games");
    return GameHiveBox._gameBox!;
  }
}
