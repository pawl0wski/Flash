import 'command.dart';
import 'exceptions/cant_find_window.dart';

class XDoToolCommand extends Command {
  XDoToolCommand() : super("xdotool");

  String getWindowNameByPid(int pid) {
    var window = _getFirstWindowByPid(pid);
    var windowName = _getWindowNameByWindow(window);
    return windowName;
  }

  int _getFirstWindowByPid(int pid) {
    List<String> windows =
        execute(["search", "--pid", pid.toString()]).split("\n");
    if (windows.isEmpty) throw CantFindWindow();
    return int.parse(windows.first);
  }

  String _getWindowNameByWindow(int window) {
    var windowName = execute(["getwindowname", window.toString()]);
    return windowName.trim();
  }
}
