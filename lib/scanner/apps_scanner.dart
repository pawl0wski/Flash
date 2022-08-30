import 'package:flash/globals.dart';
import 'package:flash/scanner/game_run_checker/game_run_checker.dart';
import 'package:flash/utils/commands/xrandr_command.dart';
import 'package:flash/utils/repository/display_repository.dart';
import 'package:flash/utils/repository/game_repository.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:flash/utils/repository/models/game.dart';
import 'package:flash/utils/settings/settings_manipulator.dart';

class AppsScanner {
  final GameRepository _gameRepository;
  final SettingsManipulator _settingsManipulator;
  final XRandrCommand _xRandrCommand;
  final GameRunChecker _gameRunChecker;
  final DisplayRepository _displayRepository;

  AppsScanner(
      {GameRepository? gameRepository,
      SettingsManipulator? settingsManipulator,
      XRandrCommand? xRandrCommand,
      GameRunChecker? gameRunChecker,
      DisplayRepository? displayRepository})
      : _gameRepository = gameRepository ?? GameRepository(),
        _gameRunChecker = gameRunChecker ?? GameRunChecker(),
        _xRandrCommand = xRandrCommand ?? XRandrCommand(),
        _displayRepository = displayRepository ?? DisplayRepository(),
        _settingsManipulator = settingsManipulator ?? SettingsManipulator();

  Future<void> scan() async {
    while (true) {
      await _waitCheckGameTimeout();
      var anyGameRunning = false;
      if (Globals.scannerEnabled) {
        for (var game in _gameRepository.getAll()) {
          if (_gameRunChecker.checkIfGameIsRunning(game)) {
            _changeDisplayIfGameHaveDisplay(game);
            anyGameRunning = true;
            break;
          }
        }
        if (anyGameRunning == false) {
          _changeCurrentDisplayToBlank();
        }
      }
    }
  }

  _waitCheckGameTimeout() async => await Future.delayed(
      Duration(seconds: _settingsManipulator.checkGameTimeout));

  _changeDisplayIfGameHaveDisplay(Game game) {
    var display = _displayRepository.get(game.displayUuid ?? "");
    if (display != null) {
      for (var monitor in _settingsManipulator.monitorsToChange) {
        _xRandrCommand.changeDisplay(display: display, monitor: monitor);
      }
    }
  }

  _changeCurrentDisplayToBlank() {
    for (var monitor in _settingsManipulator.monitorsToChange) {
      _xRandrCommand.changeDisplay(
          display: Display.createBlank(), monitor: monitor);
    }
  }
}
