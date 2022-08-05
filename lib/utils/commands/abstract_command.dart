import 'dart:io';

import 'package:flash/utils/commands/exceptions/command_invalid_response.dart';
import 'package:meta/meta.dart';

abstract class Command {
  @protected
  final String commandName;

  Command(this.commandName);

  String execute(List<String> arguments) {
    var commandOutput = Process.runSync(commandName, arguments).stdout;
    if (checkResponse(commandOutput) == false) {
      throw CommandInvalidResponse(
          commandName: commandName, response: commandOutput);
    }
    return commandOutput;
  }

  bool checkResponse(String response);

  @protected
  throwExceptionIfResponseIsInvalid(String response) {
    throw CommandInvalidResponse(commandName: commandName, response: response);
  }
}
