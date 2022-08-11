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
  }

  _onLoadGames(GamesEventLoadGames event, Emitter<GamesState> emitter) {
    _getGamesFromRepository();
    _emitGamesStateLoaded(emitter);
  }

  _getGamesFromRepository() {
    _games = _gameRepository.getAllGames();
  }

  _emitGamesStateLoaded(Emitter<GamesState> emitter) {
    emitter(GamesStateLoaded(games: _games));
  }
}
