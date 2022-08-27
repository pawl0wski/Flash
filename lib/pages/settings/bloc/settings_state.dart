part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
}

class SettingsStateShowSettings extends SettingsState {
  final SettingsManipulator settingsManipulator;

  const SettingsStateShowSettings(this.settingsManipulator);

  @override
  List<Object> get props => [settingsManipulator];
}

class SettingsStateLoading extends SettingsState {
  const SettingsStateLoading();

  @override
  List<Object?> get props => [];
}
