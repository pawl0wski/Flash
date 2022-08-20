import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/repository/game_repository.dart';
import 'package:flash/utils/repository/models/game.dart';
import 'package:meta/meta.dart';

part 'game_editor_event.dart';
part 'game_editor_state.dart';

class GameEditorBloc extends Bloc<GameEditorEvent, GameEditorState> {
  final Game _game;
  final GameRepository _gameRepository;
  String _newName;

  GameEditorBloc({
    required Game game,
    GameRepository? gameRepository,
  })  : _game = game,
        _newName = game.name,
        _gameRepository = gameRepository ?? GameRepository(),
        super(GameEditorStateInitial(name: game.name)) {
    on<GameEditorEventChangeName>(_onChangeName);
    on<GameEditorEventSave>(_onSave);
  }

  _onChangeName(
      GameEditorEventChangeName event, Emitter<GameEditorState> emitter) {
    _updateNameWithEventName(event);
  }

  _onSave(GameEditorEventSave event, Emitter<GameEditorState> emitter) {
    _game.name = _newName;
    _gameRepository.update(_game);
    emitter(GameEditorStateClose());
  }

  _updateNameWithEventName(GameEditorEventChangeName event) {
    _newName = event.name;
  }
}
