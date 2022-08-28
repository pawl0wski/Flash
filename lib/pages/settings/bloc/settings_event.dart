part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class SettingsEventLoadSettings extends SettingsEvent {
  const SettingsEventLoadSettings();

  @override
  List<Object?> get props => [];
}

class SettingsEventChangeSelectedMonitor extends SettingsEvent {
  final String newMonitor;

  const SettingsEventChangeSelectedMonitor(this.newMonitor);

  @override
  List<Object?> get props => [newMonitor];
}

class SettingsEventToggleUseAllMonitors extends SettingsEvent {
  const SettingsEventToggleUseAllMonitors();

  @override
  List<Object?> get props => [];
}

class SettingsEventChangeCheckGameTimeout extends SettingsEvent {
  final int newCheckGameTimeout;

  const SettingsEventChangeCheckGameTimeout(this.newCheckGameTimeout);

  @override
  List<Object?> get props => [newCheckGameTimeout];
}
