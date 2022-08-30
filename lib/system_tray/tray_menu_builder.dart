import 'package:flash/utils/settings/settings_manipulator.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';
import 'package:system_tray/system_tray.dart';

class TrayMenuBuilder {
  final SettingsManipulator _settingsManipulator;

  TrayMenuBuilder({SettingsManipulator? settingsManipulator})
      : _settingsManipulator = settingsManipulator ?? SettingsManipulator();

  List<MenuItem> build() {
    if (_settingsManipulator.closeWillHideWindow) {
      return [_buildShowMenuItem(), _buildQuitMenuItem()];
    } else {
      return [_buildQuitMenuItem()];
    }
  }

  MenuItem _buildShowMenuItem() {
    return MenuItemLable(label: "Show", onClicked: (_) => appWindow?.show());
  }

  MenuItem _buildQuitMenuItem() {
    return MenuItemLable(label: "Quit", onClicked: (_) => appWindow?.close());
  }
}
