part of 'settings_bloc.dart';

abstract class SettingsState {
  const SettingsState();
}

class SettingsStateShowSettings extends SettingsState {
  final SettingsManipulator settingsManipulator;

  const SettingsStateShowSettings(this.settingsManipulator);
}

class SettingsStateLoading extends SettingsState {
  const SettingsStateLoading();
}
