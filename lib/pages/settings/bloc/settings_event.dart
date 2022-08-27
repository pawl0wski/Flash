part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class SettingsEventLoadSettings extends SettingsEvent {
  const SettingsEventLoadSettings();

  @override
  List<Object?> get props => [];
}
