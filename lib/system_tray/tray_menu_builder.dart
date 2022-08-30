import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';
import 'package:system_tray/system_tray.dart';

class TrayMenuBuilder {
  List<MenuItem> build() {
    return [_buildShowMenuItem(), _buildQuitMenuItem()];
  }

  MenuItem _buildShowMenuItem() {
    return MenuItemLable(label: "Show", onClicked: (_) => appWindow?.show());
  }

  MenuItem _buildQuitMenuItem() {
    return MenuItemLable(label: "Quit", onClicked: (_) => appWindow?.close());
  }
}
