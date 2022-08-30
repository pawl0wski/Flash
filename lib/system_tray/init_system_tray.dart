import 'package:flash/system_tray/tray_menu_builder.dart';
import 'package:system_tray/system_tray.dart';

Future<void> initSystemTray() async {
  final AppWindow appWindow = AppWindow();
  final SystemTray systemTray = SystemTray();

  await systemTray.initSystemTray(
    iconPath: "assets/flash-systemtray.png",
  );

  final Menu menu = Menu();
  await menu.buildFrom(TrayMenuBuilder().build());

  await systemTray.setContextMenu(menu);

  systemTray.registerSystemTrayEventHandler((eventName) {
    if (eventName == kSystemTrayEventClick) {
      appWindow.show();
    }
  });
}
