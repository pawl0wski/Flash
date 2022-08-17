import 'package:flash/utils/commands/exceptions/command_invalid_output.dart';
import 'package:flash/utils/commands/validators/command_validator.dart';

class PwdxValidator extends CommandValidator {
  @override
  String get commandName => "pwdx";

  @override
  bool isValidOutput(String commandOutput) {
    if (commandOutput.contains("No such process")) {
      throw CommandInvalidOutput(
          commandName: commandName, commandOutput: commandOutput);
    }
    return true;
  }
}
