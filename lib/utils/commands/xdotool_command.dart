import '../game_repository/models/game.dart';
import 'command.dart';
import 'exceptions/cant_find_window.dart';

class XDoToolCommand extends Command {
  XDoToolCommand() : super("xdotool");

  Game getGameFromPid(int pid) {
    var game = Game();
    var window = _getFirstWindowByPid(pid);
    game.processName = _getProcessNameByWindow(window);
    game.name = _getWindowNameByWindow(window);
    return game;
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

  String _getProcessNameByWindow(int window) {
    var processName = execute(["getwindowclassname", window.toString()]);
    return processName.trim();
  }
}
