import 'game_repository.dart';
import 'hive_box/display_hive_box.dart';
import 'models/display.dart';
import 'models/game.dart';
import 'repository.dart';

class DisplayRepository extends Repository<Display> {
  final GameRepository _gameRepository;

  DisplayRepository({DisplayHiveBox? hiveBox, GameRepository? gameRepository})
      : _gameRepository = gameRepository ?? GameRepository(),
        super(hiveBox: hiveBox ?? DisplayHiveBox());

  @override
  void delete(String uuid) {
    _removeDisplayUuidFromAssociatedGames(uuid);
    super.delete(uuid);
  }

  void _removeDisplayUuidFromAssociatedGames(String displayUuid) {
    var allGames = _gameRepository.getAll();
    var gamesWithDisplayUuid =
        allGames.where((Game game) => game.displayUuid == displayUuid);
    for (var game in gamesWithDisplayUuid) {
      game.displayUuid = null;
      _gameRepository.update(game);
    }
  }
}
