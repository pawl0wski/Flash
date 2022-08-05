import 'dart:io';

abstract class Command {
  final String _executable;
  Command(String executable) : _executable = executable;

  String execute(List<String> arguments) {
    var commandOutput = Process.runSync(_executable, arguments);
    return commandOutput.stdout;
  }
}
