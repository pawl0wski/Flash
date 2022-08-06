import 'package:flash/utils/commands/scrapers/models/scraped_whereis.dart';
import 'package:flash/utils/commands/whereis_command.dart';

class DependencyChecker {
  final WhereisCommand _whereisCommand;

  DependencyChecker({required WhereisCommand commandExecutor})
      : _whereisCommand = commandExecutor;

  factory DependencyChecker.withDefaultWhereisCommand() {
    return DependencyChecker(commandExecutor: WhereisCommand());
  }

  bool checkIfExists(String executable) {
    var whereisOutput = _executeWhereIsCommand(executable);
    return whereisOutput.commandExist;
  }

  ScrapedWhereis _executeWhereIsCommand(String executable) {
    return _whereisCommand.executeAndScrap([executable]);
  }
}
