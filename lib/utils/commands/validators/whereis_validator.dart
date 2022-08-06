import 'package:flash/utils/commands/validators/abstract_validator.dart';

class WhereisCommandValidator extends AbstractCommandValidator {
  WhereisCommandValidator({required super.commandName});

  @override
  bool isValidOutput(String commandOutput) {
    return (_checkIfBeginsWithTheExecutable(commandOutput) &&
        _checkIfHaveOneColon(commandOutput));
  }

  bool _checkIfBeginsWithTheExecutable(String commandOutput) {
    return commandOutput.startsWith(commandName);
  }

  bool _checkIfHaveOneColon(String commandOutput) {
    return commandOutput.allMatches(":").length == 1;
  }
}
