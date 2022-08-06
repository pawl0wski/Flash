import 'package:flash/utils/commands/exceptions/command_invalid_output.dart';
import 'package:flash/utils/commands/validators/abstract_validator.dart';
import 'package:flash/utils/process_adapter/process_adapter.dart';
import 'package:meta/meta.dart';

abstract class Command {
  @protected
  final String commandName;
  final AbstractCommandValidator? _validator;
  final ProcessAdapter _processAdapter;

  Command(this.commandName,
      {AbstractCommandValidator? validator, ProcessAdapter? processAdapter})
      : _validator = validator,
        _processAdapter = processAdapter ?? ProcessAdapter();

  String execute(List<String> arguments) {
    var commandOutput = _processAdapter.execute(commandName, arguments);
    if (_isValidatorNotNullAndOutputIsInvalid(commandOutput)) {
      _throwExceptionIfOutputIsInvalid(commandOutput)
    }
    return commandOutput;
  }

  bool _isValidatorNotNullAndOutputIsInvalid(String commandOutput) {
    return (_validator != null && !_validator!.isValidOutput(commandOutput));
  }

  _throwExceptionIfOutputIsInvalid(String commandOutput) {
    throw CommandInvalidOutput(commandName: commandName, commandOutput: commandOutput);
  }
}
