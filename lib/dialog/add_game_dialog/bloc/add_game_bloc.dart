import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/commands/ps_command.dart';
import 'package:flash/utils/commands/pwdx_command.dart';
import 'package:flash/utils/commands/xdotool_command.dart';
import 'package:flash/utils/commands/xprop_command.dart';
import 'package:flash/utils/game_repository/game_repository.dart';
import 'package:flash/utils/game_repository/models/game.dart';
import 'package:meta/meta.dart';

part 'add_game_event.dart';
part 'add_game_state.dart';

class AddGameBloc extends Bloc<AddGameEvent, AddGameState> {
  final XPropCommand _xPropCommand;
  final XDoToolCommand _xDoToolCommand;
  final PwdxCommand _pwdxCommand;
  final PsCommand _psCommand;
  final GameRepository _gameRepository;

  AddGameBloc(
      {XPropCommand? xPropCommand,
      XDoToolCommand? xDoToolCommand,
      GameRepository? gameRepository,
      PwdxCommand? pwdxCommand,
      PsCommand? psCommand})
      : _xPropCommand = xPropCommand ?? XPropCommand(),
        _xDoToolCommand = xDoToolCommand ?? XDoToolCommand(),
        _gameRepository = gameRepository ?? GameRepository(),
        _psCommand = psCommand ?? PsCommand(),
        _pwdxCommand = pwdxCommand ?? PwdxCommand(),
        super(AddGameStateClickOnGame()) {
    on<AddGameEventShowClickOnGame>(_onShowClickOnGame);
  }

  _onShowClickOnGame(
      AddGameEventShowClickOnGame event, Emitter<AddGameState> emitter) async {
    emitter(AddGameStateClickOnGame());
    var game = await _getGame();
    _gameRepository.addGame(game);
    emitter(AddGameStateClose());
  }

  Future<Game> _getGame() async {
    var output = await _xPropCommand.executeAndScrapAsync([]);
    var windowName = _xDoToolCommand.getWindowNameByPid(output.pid);
    var executable =
        _psCommand.executeAndScrap([]).getEntryByPid(output.pid)?.command;
    var workingDirectory =
        _pwdxCommand.executeAndScrap([output.pid.toString()]).workingDirectory;
    return Game(
        name: windowName,
        processName:
            "$workingDirectory/$executable"); // TODO: Throw exception if procesName is null
  }
}
