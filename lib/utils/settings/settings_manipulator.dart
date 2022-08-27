import 'hive_box/settings_hive_box.dart';
import 'models/settings.dart';

class SettingsManipulator {
  final SettingsHiveBox _settingsHiveBox;

  SettingsManipulator({SettingsHiveBox? settingsHiveBox})
      : _settingsHiveBox = settingsHiveBox ?? SettingsHiveBox();

  Settings get settings {
    var box = _settingsHiveBox.box;
    if (box.keys.isEmpty) {
      box.put(0, Settings.createDefault());
    }
    return box.get(0);
  }

  changeScreenToChangeDisplay(String? screen) {
    settings.screenToChangeDisplay = screen;
    settings.save();
  }

  String? get screenToChangeDisplay => settings.screenToChangeDisplay;

  changeAvailableScreens(List<String> screens) {
    settings.availableScreens = screens;
    settings.save();
  }

  List<String> get availableScreens => settings.availableScreens;

  toggleUseAllScreens() {
    settings.useAllScreens = !settings.useAllScreens;
    settings.save();
  }

  bool get useAllScreens => settings.useAllScreens;
}
