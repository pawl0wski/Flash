import 'package:flash/utils/commands/xrandr_command.dart';

import 'hive_box/settings_hive_box.dart';
import 'models/settings.dart';

class SettingsManipulator {
  final SettingsHiveBox _settingsHiveBox;
  final XRandrCommand _xRandrCommand;

  SettingsManipulator(
      {SettingsHiveBox? settingsHiveBox, XRandrCommand? xRandrCommand})
      : _settingsHiveBox = settingsHiveBox ?? SettingsHiveBox(),
        _xRandrCommand = xRandrCommand ?? XRandrCommand();

  Settings get settings {
    var box = _settingsHiveBox.box;
    if (box.keys.isEmpty) {
      box.put(0, Settings.createDefault());
    }
    return box.get(0);
  }

  changeSelectedMonitor(String? monitor) {
    settings.selectedMonitor = monitor;
    settings.save();
  }

  String get selectedMonitor =>
      settings.selectedMonitor ?? availableMonitors.first;

  changeAvailableMonitors(List<String> monitors) {
    settings.availableMonitors = monitors;
    settings.save();
  }

  updateAllMonitors() {
    var monitors = _xRandrCommand.getMonitors();
    changeAvailableMonitors(monitors);
  }

  List<String> get availableMonitors => settings.availableMonitors;

  toggleUseAllMonitors() {
    settings.useAllMonitors = !settings.useAllMonitors;
    settings.save();
  }

  bool get useAllMonitors => settings.useAllMonitors;

  updateCheckGameTimeout(int checkGameTimeout) {
    settings.checkGameTimeout = checkGameTimeout;
    settings.save();
  }

  int get checkGameTimeout => settings.checkGameTimeout;

  List<String> get monitorsToChange {
    if (useAllMonitors) {
      return availableMonitors;
    }
    return [selectedMonitor];
  }
}
