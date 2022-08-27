part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
}

class SettingsStateShowSettings extends SettingsState {
  final Settings settings;

  const SettingsStateShowSettings(this.settings);

  @override
  List<Object> get props => [settings];
}

class SettingsStateLoading extends SettingsState {
  const SettingsStateLoading();

  @override
  List<Object?> get props => [];
}
