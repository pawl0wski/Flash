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

  changeMonitorToChangeDisplay(String? monitor) {
    settings.monitorToChangeDisplay = monitor;
    settings.save();
  }

  String? get monitorToChangeDisplay => settings.monitorToChangeDisplay;

  changeAvailableMonitors(List<String> monitors) {
    settings.availableMonitors = monitors;
    settings.save();
  }

  List<String> get availableMonitors => settings.availableMonitors;

  toggleUseAllMonitors() {
    settings.useAllMonitors = !settings.useAllMonitors;
    settings.save();
  }

  bool get useAllMonitors => settings.useAllMonitors;

  updateAllMonitors() {
    var monitors = _xRandrCommand.getMonitors();
    changeAvailableMonitors(monitors);
  }
}
