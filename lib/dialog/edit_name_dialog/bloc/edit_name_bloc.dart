import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/repository/game_repository.dart';
import 'package:flash/utils/repository/models/game.dart';
import 'package:meta/meta.dart';

part 'edit_name_event.dart';
part 'edit_name_state.dart';

class EditNameBloc extends Bloc<EditNameEvent, EditNameState> {
  final Game _game;
  final GameRepository _gameRepository;
  String _newName;

  EditNameBloc({
    required Game game,
    GameRepository? gameRepository,
  })  : _game = game,
        _newName = game.name,
        _gameRepository = gameRepository ?? GameRepository(),
        super(EditNameStateInitial(name: game.name)) {
    on<EditNameEventChangeName>(_onChangeName);
    on<EditNameEventSave>(_onSave);
  }

  _onChangeName(EditNameEventChangeName event, Emitter<EditNameState> emitter) {
    _updateNameWithEventName(event);
  }

  _onSave(EditNameEventSave event, Emitter<EditNameState> emitter) {
    _game.name = _newName;
    _gameRepository.update(_game);
    emitter(EditNameStateClose());
  }

  _updateNameWithEventName(EditNameEventChangeName event) {
    _newName = event.name;
  }
}
