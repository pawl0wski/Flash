import 'package:flash/utils/repository/repository.dart';
import 'package:uuid/uuid.dart';

import 'hive_box/game_hive_box.dart';
import 'models/game.dart';

class GameRepository extends Repository<Game> {
  GameRepository({GameHiveBox? gameHiveBox, Uuid? uuid})
      : super(hiveBox: gameHiveBox ?? GameHiveBox(), uuid: uuid);
}
