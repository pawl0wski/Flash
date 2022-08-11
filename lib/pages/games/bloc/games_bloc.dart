import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/game_repository/game_repository.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GameRepository _gameRepository;

  GamesBloc({GameRepository? gameRepository})
      : _gameRepository = gameRepository ?? GameRepository(),
        super(const GamesState(games: [])) {
    on<GamesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
