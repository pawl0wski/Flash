import 'package:bloc/bloc.dart';
import 'package:flash/globals.dart';
import 'package:flash/utils/commands/xrandr_command.dart';
import 'package:flash/utils/repository/display_repository.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:flash/utils/settings/settings_manipulator.dart';
import 'package:meta/meta.dart';

part 'preview_display_event.dart';
part 'preview_display_state.dart';

class PreviewDisplayBloc
    extends Bloc<PreviewDisplayEvent, PreviewDisplayState> {
  final DisplayRepository _displayRepository;
  final Display _display;
  final XRandrCommand _xRandrCommand;
  final SettingsManipulator _settingsManipulator;
  int second = 5;

  PreviewDisplayBloc(Display display,
      {DisplayRepository? displayRepository,
      XRandrCommand? xRandrCommand,
      SettingsManipulator? settingsManipulator})
      : _display = display,
        _xRandrCommand = xRandrCommand ?? XRandrCommand(),
        _settingsManipulator = settingsManipulator ?? SettingsManipulator(),
        _displayRepository = displayRepository ?? DisplayRepository(),
        super(const PreviewDisplayStateSetSecond(5)) {
    on<PreviewDisplayEventStartTimer>(_onStartTimer);
    on<PreviewDisplayEventAccept>(_onAccept);
    on<PreviewDisplayEventClose>(_onClose);
  }

  _onStartTimer(PreviewDisplayEventStartTimer event,
      Emitter<PreviewDisplayState> emitter) async {
    _setDisplay(display: _display);
    for (int i = second; i > 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      emitter(PreviewDisplayStateSetSecond(--second));
    }
    Globals.setScannerEnabled(false);
    _setDisplay();
    emitter(const PreviewDisplayStateBackToEdit());
  }

  _onAccept(
      PreviewDisplayEventAccept event, Emitter<PreviewDisplayState> emitter) {
    _displayRepository.addOrUpdate(_display);
    _setDisplay();
    Globals.setScannerEnabled(true);
    emitter(const PreviewDisplayStateClose());
  }

  _onClose(
      PreviewDisplayEventClose event, Emitter<PreviewDisplayState> emitter) {
    _setDisplay();
    Globals.setScannerEnabled(true);
    emitter(const PreviewDisplayStateBackToEdit());
  }

  _setDisplay({Display? display}) {
    for (var monitor in _settingsManipulator.monitorsToChange) {
      _xRandrCommand.changeDisplay(
          display: display ?? Display.createBlank(), monitor: monitor);
    }
  }
}
