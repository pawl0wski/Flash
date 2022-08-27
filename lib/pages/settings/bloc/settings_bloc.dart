import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/settings/models/settings.dart';
import 'package:flash/utils/settings/settings_manipulator.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsManipulator _manipulator;

  SettingsBloc({SettingsManipulator? manipulator})
      : _manipulator = manipulator ?? SettingsManipulator(),
        super(const SettingsStateLoading()) {
    on<SettingsEventLoadSettings>(_onLoadSettings);
  }

  _onLoadSettings(
      SettingsEventLoadSettings event, Emitter<SettingsState> emitter) {
    emitter(SettingsStateShowSettings(_manipulator.settings));
  }
}