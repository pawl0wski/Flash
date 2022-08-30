import 'package:system_tray/system_tray.dart';

Future<void> initSystemTray() async {
  final AppWindow appWindow = AppWindow();
  final SystemTray systemTray = SystemTray();

  await systemTray.initSystemTray(
    iconPath: "assets/flash-systemtray-on.png",
  );

  final Menu menu = Menu();
  await menu.buildFrom([]);

  await systemTray.setContextMenu(menu);

  systemTray.registerSystemTrayEventHandler((eventName) {
    if (eventName == kSystemTrayEventClick) {
      appWindow.show();
    }
  });
}
