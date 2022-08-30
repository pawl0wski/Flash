import 'package:flash/utils/commands/ps_command.dart';
import 'package:flash/utils/commands/pwdx_command.dart';
import 'package:flash/utils/commands/xrandr_command.dart';
import 'package:flash/utils/repository/models/game.dart';

class GameRunChecker {
  final PsCommand _psCommand;
  final PwdxCommand _pwdxCommand;

  GameRunChecker(
      {PsCommand? psCommand,
      XRandrCommand? xRandrCommand,
      PwdxCommand? pwdxCommand})
      : _psCommand = psCommand ?? PsCommand(),
        _pwdxCommand = pwdxCommand ?? PwdxCommand();

  bool checkIfGameIsRunning(Game game) {
    var scrapPsCommand = _psCommand.executeAndScrap([]);
    for (var runningApp in scrapPsCommand.entries) {
      if (runningApp.command == game.processName) {
        return _checkIfWorkingDirectoryIsCorrect(runningApp.pid, game);
      }
    }
    return false;
  }

  bool _checkIfWorkingDirectoryIsCorrect(int pid, Game game) =>
      (_pwdxCommand.getWorkingDirectoryOfPid(pid) == game.workingDirectory);
}
