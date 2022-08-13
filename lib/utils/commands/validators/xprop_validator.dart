import 'package:flash/utils/commands/validators/command_validator.dart';

class XPropValidator extends CommandValidator {
  @override
  String get commandName => "xprop";

  @override
  bool isValidOutput(String commandOutput) {
    return (_checkIfHaveParameterSeparators(commandOutput));
  }

  bool _checkIfHaveParameterSeparators(String commandOutput) {
    return " = ".allMatches(commandOutput).length > 1;
  }
}
