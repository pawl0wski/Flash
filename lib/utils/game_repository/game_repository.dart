import 'package:flash/utils/game_repository/models/game.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import 'hive_box/game_hive_box.dart';

class GameRepository {
  final GameHiveBox _gameHiveBox;
  final Uuid _uuid;

  GameRepository({GameHiveBox? gameHiveBox, Uuid? uuid})
      : _uuid = uuid ?? const Uuid(),
        _gameHiveBox = gameHiveBox ?? GameHiveBox();

  List<Game> getAllGames() {
    List<Game> games = [];
    for (var gameUuid in _box.keys) {
      var game = _box.get(gameUuid);
      if (game != null) games.add(game);
    }
    return games;
  }

  void deleteGame(String gameUuid) {
    _box.delete(gameUuid);
  }

  Game addGame(Game game) {
    String gameUuid = _generateUuid();
    game = _assignUuidToGame(gameUuid, game);
    _box.put(gameUuid, game);
    return game;
  }

  String _generateUuid() {
    return _uuid.v4();
  }

  Game _assignUuidToGame(String uuid, Game game) {
    return game..uuid = uuid;
  }

  Box<Game> get _box => _gameHiveBox.box;
}
