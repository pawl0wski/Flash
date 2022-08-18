import 'package:flash/utils/commands/ps_command.dart';
import 'package:flash/utils/commands/pwdx_command.dart';
import 'package:flash/utils/commands/xdotool_command.dart';
import 'package:flash/utils/commands/xprop_command.dart';
import 'package:flash/utils/game_creator/exception/cant_find_psentry.dart';
import 'package:flash/utils/repository/game_repository.dart';
import 'package:flash/utils/repository/models/game.dart';

class GameCreator {
  final XPropCommand _xPropCommand;
  final XDoToolCommand _xDoToolCommand;
  final PwdxCommand _pwdxCommand;
  final PsCommand _psCommand;
  final GameRepository _gameRepository;

  GameCreator(
      {XPropCommand? xPropCommand,
      XDoToolCommand? xDoToolCommand,
      GameRepository? gameRepository,
      PwdxCommand? pwdxCommand,
      PsCommand? psCommand})
      : _xPropCommand = xPropCommand ?? XPropCommand(),
        _xDoToolCommand = xDoToolCommand ?? XDoToolCommand(),
        _gameRepository = gameRepository ?? GameRepository(),
        _psCommand = psCommand ?? PsCommand(),
        _pwdxCommand = pwdxCommand ?? PwdxCommand();

  Future<Game> getGameAndAddByClick() async {
    var pid = await _clickOnGameAndGetPid();
    var name = _getWindowName(pid: pid);
    var executable = _getExecutable(pid: pid);
    var workingDirectory = _getWorkingDirectory(pid: pid);
    var game = Game(
        name: name,
        processName: executable,
        workingDirectory: workingDirectory);
    return _gameRepository.add(game);
  }

  Future<int> _clickOnGameAndGetPid() async {
    var scrapedXProp = await _xPropCommand.executeAndScrapAsync([]);
    return scrapedXProp.pid;
  }

  String _getWindowName({required int pid}) {
    return _xDoToolCommand.getWindowNameByPid(pid);
  }

  String _getExecutable({required int pid}) {
    var psEntry = _psCommand.executeAndScrap([]).getEntryByPid(pid);
    if (psEntry != null) {
      return psEntry.command;
    }
    throw CantFindPsEntry(pid: pid);
  }

  String _getWorkingDirectory({required int pid}) {
    return _pwdxCommand.executeAndScrap([pid.toString()]).workingDirectory;
  }
}
