import 'hive_box/game_hive_box.dart';

class GameRepository {
  GameHiveBox _gameHiveBox;

  GameRepository({GameHiveBox? gameHiveBox})
      : _gameHiveBox = gameHiveBox ?? GameHiveBox();
}
