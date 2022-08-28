import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/settings/settings_manipulator.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsManipulator _manipulator;

  SettingsBloc({SettingsManipulator? manipulator})
      : _manipulator = manipulator ?? SettingsManipulator(),
        super(const SettingsStateLoading()) {
    on<SettingsEventLoadSettings>(_onLoadSettings);
    on<SettingsEventChangeSelectedMonitor>(_onChangeSelectedMonitor);
    on<SettingsEventToggleUseAllMonitors>(_onToggleUseAllMonitor);
    on<SettingsEventChangeCheckGameTimeout>(_onChangeCheckGameTimeout);
  }

  _onLoadSettings(
      SettingsEventLoadSettings event, Emitter<SettingsState> emitter) {
    _emitShowSettings(emitter);
  }

  _onChangeSelectedMonitor(SettingsEventChangeSelectedMonitor event,
      Emitter<SettingsState> emitter) {
    _manipulator.changeSelectedMonitor(event.newMonitor);
    _emitShowSettings(emitter);
  }

  _onToggleUseAllMonitor(
      SettingsEventToggleUseAllMonitors event, Emitter<SettingsState> emitter) {
    _manipulator.toggleUseAllMonitors();
    _emitShowSettings(emitter);
  }

  _onChangeCheckGameTimeout(SettingsEventChangeCheckGameTimeout event,
      Emitter<SettingsState> emitter) {
    _manipulator.updateCheckGameTimeout(event.newCheckGameTimeout);
    _emitShowSettings(emitter);
  }

  _emitShowSettings(Emitter<SettingsState> emitter) {
    _updateMonitors();
    emitter(SettingsStateShowSettings(_manipulator));
  }

  _updateMonitors() {
    _manipulator.updateAllMonitors();
  }
}
