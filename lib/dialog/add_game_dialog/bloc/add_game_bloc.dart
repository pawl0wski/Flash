import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/commands/xdotool_command.dart';
import 'package:flash/utils/commands/xprop_command.dart';
import 'package:meta/meta.dart';

part 'add_game_event.dart';
part 'add_game_state.dart';

class AddGameBloc extends Bloc<AddGameEvent, AddGameState> {
  final XPropCommand _xPropCommand;
  final XDoToolCommand _xDoToolCommand;

  AddGameBloc({XPropCommand? xPropCommand, XDoToolCommand? xDoToolCommand})
      : _xPropCommand = xPropCommand ?? XPropCommand(),
        _xDoToolCommand = xDoToolCommand ?? XDoToolCommand(),
        super(AddGameStateClickOnGame()) {
    on<AddGameEventShowClickOnGame>(_onShowClickOnGame);
  }

  _onShowClickOnGame(
      AddGameEventShowClickOnGame event, Emitter<AddGameState> emitter) async {
    emitter(AddGameStateClickOnGame());
    _executeXPropAndChangeState();
  }

  _executeXPropAndChangeState() async {
    var output = await _xPropCommand.executeAndScrapAsync([]);
  }
}
