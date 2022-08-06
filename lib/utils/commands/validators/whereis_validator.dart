import 'package:flash/utils/commands/validators/abstract_validator.dart';

class WhereisCommandValidator extends AbstractCommandValidator {
  @override
  String get commandName => "whereis";

  @override
  bool isValidOutput(String commandOutput) {
    return (_checkIfHaveOneColon(commandOutput));
  }

  bool _checkIfHaveOneColon(String commandOutput) {
    return ":".allMatches(commandOutput).length == 1;
  }
}
