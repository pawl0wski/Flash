import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/commands/xprop_command.dart';
import 'package:meta/meta.dart';

part 'add_game_event.dart';
part 'add_game_state.dart';

class AddGameBloc extends Bloc<AddGameEvent, AddGameState> {
  final XPropCommand _xPropCommand;

  AddGameBloc({XPropCommand? xPropCommand})
      : _xPropCommand = xPropCommand ?? XPropCommand(),
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
    print(output.pid);
  }
}
