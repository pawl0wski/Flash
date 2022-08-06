import 'package:flash/utils/process_adapter/process_adapter.dart';
import 'package:meta/meta.dart';

import 'exceptions/command_invalid_output.dart';
import 'validators/command_validator.dart';

abstract class Command {
  @protected
  final String commandName;
  final CommandValidator? _validator;
  final ProcessAdapter _processAdapter;

  Command(this.commandName,
      {CommandValidator? validator, ProcessAdapter? processAdapter})
      : _validator = validator,
        _processAdapter = processAdapter ?? ProcessAdapter();

  String execute(List<String> arguments) {
    var commandOutput = _processAdapter.execute(commandName, arguments);
    if (_isValidatorNotNullAndOutputIsInvalid(commandOutput)) {
      _throwExceptionIfOutputIsInvalid(commandOutput);
    }
    return commandOutput;
  }

  bool _isValidatorNotNullAndOutputIsInvalid(String commandOutput) {
    return (_validator != null && !_validator!.isValidOutput(commandOutput));
  }

  _throwExceptionIfOutputIsInvalid(String commandOutput) {
    throw CommandInvalidOutput(
        commandName: commandName, commandOutput: commandOutput);
  }
}
