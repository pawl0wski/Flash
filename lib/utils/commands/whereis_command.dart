import 'package:flash/utils/commands/abstract_command.dart';

class WhereisCommand extends Command {
  WhereisCommand() : super("whereis");

  @override
  bool isValidOutput(String response) {
    return (checkIfBeginsWithTheExecutable(response) &&
        checkIfHaveOneColon(response));
  }

  bool checkIfBeginsWithTheExecutable(String response) {
    return response.startsWith(commandName);
  }

  bool checkIfHaveOneColon(String response) {
    return response.allMatches(":").length == 1;
  }
}
