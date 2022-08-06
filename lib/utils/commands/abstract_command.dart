import 'dart:io';

import 'package:flash/utils/commands/exceptions/command_invalid_output.dart';
import 'package:flash/utils/commands/validators/abstract_validator.dart';
import 'package:meta/meta.dart';

abstract class Command {
  @protected
  final String commandName;
  @protected
  final AbstractCommandValidator? validator;

  Command(this.commandName, {this.validator});

  String execute(List<String> arguments) {
    var commandOutput = Process.runSync(commandName, arguments).stdout;
    if (_isValidatorNotNullAndOutputIsInvalid(commandOutput)) {
      throw CommandInvalidOutput(
          commandName: commandName, response: commandOutput);
    }
    return commandOutput;
  }

  bool _isValidatorNotNullAndOutputIsInvalid(String commandOutput) {
    return (validator != null && !validator!.isValidOutput(commandOutput));
  }

  _throwExceptionIfOutputIsInvalid(String response) {
    throw CommandInvalidOutput(commandName: commandName, response: response);
  }
}
