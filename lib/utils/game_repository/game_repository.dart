import 'package:flash/utils/game_repository/models/game.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import 'hive_box/game_hive_box.dart';

class GameRepository {
  final GameHiveBox _gameHiveBox;

  GameRepository({GameHiveBox? gameHiveBox})
      : _gameHiveBox = gameHiveBox ?? GameHiveBox();

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

  void addGame(Game newGame) {
    _box.add(newGame);
  }

  String _generateUuid() {
    return const Uuid().v4();
  }

  Box<Game> get _box => _gameHiveBox.box;
}
