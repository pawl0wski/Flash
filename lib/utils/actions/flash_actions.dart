import 'package:flash/utils/settings/settings_manipulator.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';

extension LibAdwBitsdojo on AdwActions {
  AdwActions get flash {
    var settingsManipulator = SettingsManipulator();
    return AdwActions(
      onClose: settingsManipulator.closeWillHideWindow
          ? appWindow?.hide
          : appWindow?.close,
      onMaximize: appWindow?.maximizeOrRestore,
      onMinimize: appWindow?.minimize,
      onDoubleTap: appWindow?.maximizeOrRestore,
      onHeaderDrag: appWindow?.startDragging,
    );
  }
}
