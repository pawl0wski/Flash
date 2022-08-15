import 'command.dart';
import 'exceptions/cant_find_window.dart';

class XDoToolCommand extends Command {
  XDoToolCommand() : super("xdotool");

  int _getFirstWindowByPid(int pid) {
    List<String> windows =
        execute(["search", "--pid", pid.toString()]).split("\n");
    if (windows.isEmpty) throw CantFindWindow();
    return int.parse(windows.first);
  }
}
