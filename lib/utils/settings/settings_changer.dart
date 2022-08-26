import 'hive_box/settings_hive_box.dart';
import 'models/settings.dart';

class SettingsChanger {
  final SettingsHiveBox _settingsHiveBox;

  SettingsChanger({required SettingsHiveBox settingsHiveBox})
      : _settingsHiveBox = settingsHiveBox;

  Settings get _settings {
    var box = _settingsHiveBox.box;
    if (box.keys.isEmpty) {
      box.put(0, Settings.createDefault());
    }
    return box.get(0);
  }

  changeScreenToChangeDisplay(String? screen) {
    _settings.screenToChangeDisplay = screen;
    _settings.save();
  }

  String? get screenToChangeDisplay => _settings.screenToChangeDisplay;

  changeAvailableScreens(List<String> screens) {
    _settings.availableScreens = screens;
    _settings.save();
  }

  List<String> get availableScreens => _settings.availableScreens;

  toggleUseAllScreens() {
    _settings.useAllScreens = !_settings.useAllScreens;
    _settings.save();
  }

  bool get useAllScreens => _settings.useAllScreens;
}
