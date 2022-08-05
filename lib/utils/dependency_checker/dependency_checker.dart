import 'package:flash/utils/command_executor/command_executor.dart';

class DependencyChecker {
  final CommandExecutor _commandExecutor;

  DependencyChecker({required CommandExecutor commandExecutor})
      : _commandExecutor = commandExecutor;

  factory DependencyChecker.withDefaultCommandExecutor() {
    return DependencyChecker(commandExecutor: CommandExecutor());
  }

  bool checkIfExists(String executable) {
    var whereIsOutput = _executeWhereIsCommand(executable);
    var locationsOfExecutable = _exportLocationsOfExecutableFrom(whereIsOutput);
    return _checkIfExistsAccordingToLocations(locationsOfExecutable);
  }

  String _executeWhereIsCommand(String executable) {
    return _commandExecutor.execute("whereis", [executable]);
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
