import 'dart:io';

class CommandExecutor {
  String execute(String executable, List<String> arguments) {
    var commandOutput = Process.runSync(executable, arguments);
    return commandOutput.stdout;
  }
}
