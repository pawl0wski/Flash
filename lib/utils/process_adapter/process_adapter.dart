import 'dart:io';

class ProcessAdapter {
  String execute(String command, List<String> arguments) {
    var output = Process.runSync(command, arguments);
    return output.stdout;
  }
}
