import 'dart:io';

import 'package:flash/utils/commands/exceptions/command_invalid_output.dart';
import 'package:meta/meta.dart';

abstract class Command {
  @protected
  final String commandName;

  Command(this.commandName);

  String execute(List<String> arguments) {
    var commandOutput = Process.runSync(commandName, arguments).stdout;
    if (isValidOutput(commandOutput) == false) {
      throw CommandInvalidOutput(
          commandName: commandName, response: commandOutput);
    }
    return commandOutput;
  }

  bool isValidOutput(String response);

  @protected
  throwExceptionIfOutputIsInvalid(String response) {
    throw CommandInvalidOutput(commandName: commandName, response: response);
  }
}
