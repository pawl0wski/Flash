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
        super(const ChangeDisplayStateShowDisplays(
            displays: [], currentIndex: 0)) {
    on<ChangeDisplayEventLoadDisplays>(_onLoadDisplays);
    on<ChangeDisplayEventChangeIndex>(_onChangeIndex);
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

  _emitShowDisplays(Emitter<ChangeDisplayState> emitter) {
    emitter(ChangeDisplayStateShowDisplays(
        currentIndex: _currentIndex, displays: _displays));
  }

  _getDisplays() {
    _displays = _displayRepository.getAll();
  }

  _setCurrentIndex() {
    _currentIndex = _displays
        .indexWhere((Display display) => display.uuid == _game.displayUuid);
    if (_currentIndex == -1) {
      _currentIndex = 0;
    }
  }
}
