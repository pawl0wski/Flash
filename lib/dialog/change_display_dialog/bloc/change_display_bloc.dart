import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/repository/display_repository.dart';
import 'package:flash/utils/repository/game_repository.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:flash/utils/repository/models/game.dart';

part 'change_display_event.dart';
part 'change_display_state.dart';

class ChangeDisplayBloc extends Bloc<ChangeDisplayEvent, ChangeDisplayState> {
  final Game _game;
  final GameRepository _gameRepository;
  final DisplayRepository _displayRepository;
  late List<Display> _displays;
  late int _currentIndex;

  ChangeDisplayBloc(
      {required Game game,
      GameRepository? gameRepository,
      DisplayRepository? displayRepository})
      : _game = game,
        _gameRepository = gameRepository ?? GameRepository(),
        _displayRepository = displayRepository ?? DisplayRepository(),
        super(ChangeDisplayStateShowDisplays(
            displays: [Display.createBlank()], currentIndex: 0)) {
    on<ChangeDisplayEventLoadDisplays>(_onLoadDisplays);
    on<ChangeDisplayEventChangeIndex>(_onChangeIndex);
    on<ChangeDisplayEventClose>(_onClose);
    on<ChangeDisplayEventSave>(_onSave);
  }

  _onLoadDisplays(ChangeDisplayEventLoadDisplays event,
      Emitter<ChangeDisplayState> emitter) {
    _getDisplays();
    _setCurrentIndex();
    _emitShowDisplays(emitter);
  }

  _onChangeIndex(ChangeDisplayEventChangeIndex event,
      Emitter<ChangeDisplayState> emitter) {
    _currentIndex = event.newIndex;
    _emitShowDisplays(emitter);
  }

  _onClose(ChangeDisplayEventClose event, Emitter<ChangeDisplayState> emitter) {
    emitter(ChangeDisplayStateClose());
  }

  _onSave(ChangeDisplayEventSave event, Emitter<ChangeDisplayState> emitter) {
    _setDisplayUuidInGame();
    emitter(ChangeDisplayStateClose());
  }

  _emitShowDisplays(Emitter<ChangeDisplayState> emitter) {
    emitter(ChangeDisplayStateShowDisplays(
        currentIndex: _currentIndex, displays: _displays));
  }

  _getDisplays() {
    _displays = _displayRepository.getAll();
  }

  _setDisplayUuidInGame() {
    if (_currentIndex != -1) {
      var currentDisplay = _displays[_currentIndex];
      _game.displayUuid = currentDisplay.uuid;
    } else {
      _game.displayUuid = null;
    }
    _gameRepository.update(_game);
  }

  _setCurrentIndex() {
    _currentIndex = _displays
        .indexWhere((Display display) => display.uuid == _game.displayUuid);
  }
}
