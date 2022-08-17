import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/game_creator/game_creator.dart';
import 'package:meta/meta.dart';

part 'add_game_event.dart';
part 'add_game_state.dart';

class AddGameBloc extends Bloc<AddGameEvent, AddGameState> {
  final GameCreator _gameCreator;

  AddGameBloc({GameCreator? gameCreator})
      : _gameCreator = gameCreator ?? GameCreator(),
        super(AddGameStateClickOnGame()) {
    on<AddGameEventShowClickOnGame>(_onShowClickOnGame);
  }

  _onShowClickOnGame(
      AddGameEventShowClickOnGame event, Emitter<AddGameState> emitter) async {
    emitter(AddGameStateClickOnGame());
    await _gameCreator.getGameAndAddByClick();
    emitter(AddGameStateClose());
  }
}
