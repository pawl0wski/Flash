import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/game_repository/game_repository.dart';
import 'package:flash/utils/game_repository/models/game.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GameRepository _gameRepository;
  List<Game> _games = [];

  GamesBloc({GameRepository? gameRepository})
      : _gameRepository = gameRepository ?? GameRepository(),
        super(const GamesStateLoading()) {
    on<GamesEventLoadGames>(_onLoadGames);
    on<GamesEventShowAddGameDialog>(_onShowAddGameDialog);
    on<GamesBlocEventDeleteGame>(_onDeleteGame);
    on<GamesBlocEventEditGameName>(_onEditGame);
  }

  _onLoadGames(GamesEventLoadGames event, Emitter<GamesState> emitter) {
    _getGamesFromRepository();
    _emitGamesStateLoaded(emitter);
  }

  _onShowAddGameDialog(
      GamesEventShowAddGameDialog event, Emitter<GamesState> emitter) {
    emitter(GamesStateShowAddGameDialog());
  }

  _onDeleteGame(GamesBlocEventDeleteGame event, Emitter<GamesState> emitter) {
    _gameRepository.deleteGame(event.gameToDelete.uuid);
    _getGamesFromRepository();
    _emitGamesStateLoaded(emitter);
  }

  _onEditGame(GamesBlocEventEditGameName event, Emitter<GamesState> emitter) {
    emitter(GamesStateShowEditNameDialog(game: event.gameToEdit));
  }

  _getGamesFromRepository() {
    _games = _gameRepository.getAllGames();
  }

  _emitGamesStateLoaded(Emitter<GamesState> emitter) {
    emitter(GamesStateLoaded(games: _games));
  }
}
