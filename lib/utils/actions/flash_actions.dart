import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';

extension LibAdwBitsdojo on AdwActions {
  AdwActions get flash {
    return AdwActions(
      onClose: appWindow?.hide,
      onMaximize: appWindow?.maximizeOrRestore,
      onMinimize: appWindow?.minimize,
      onDoubleTap: appWindow?.maximizeOrRestore,
      onHeaderDrag: appWindow?.startDragging,
    );
  }
}
