import 'package:flash/utils/commands/whereis_command.dart';

class DependencyChecker {
  final WhereisCommand _whereisCommand;

  DependencyChecker({required WhereisCommand commandExecutor})
      : _whereisCommand = commandExecutor;

  factory DependencyChecker.withDefaultWhereisCommand() {
    return DependencyChecker(commandExecutor: WhereisCommand());
  }

  bool checkIfExists(String executable) {
    var whereIsOutput = _executeWhereIsCommand(executable);
    var locationsOfExecutable = _exportLocationsOfExecutableFrom(whereIsOutput);
    return _checkIfExistsAccordingToLocations(locationsOfExecutable);
  }

  String _executeWhereIsCommand(String executable) {
    return _whereisCommand.execute([executable]);
  }

  List<String> _exportLocationsOfExecutableFrom(String whereIsOutput) {
    // Get second split of whereis command
    // "executable: /bin/executable /usr/bin/executable" -> "/bin/executable /usr/bin/executable"
    var secondSplitOfWhereIsOutput = whereIsOutput.split(": ").last;
    if (secondSplitOfWhereIsOutput.isEmpty) {
      return [];
    }
    // Split locations by space
    // "/bin/executable /usr/bin/executable" -> ["/bin/executable", "/usr/bin/executable"]
    var locations = secondSplitOfWhereIsOutput.split(" ");
    return locations;
  }

  bool _checkIfExistsAccordingToLocations(List<String> locationsOfExecutable) {
    return locationsOfExecutable.isNotEmpty;
  }
}
