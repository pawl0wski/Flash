class CommandInvalidOutput implements Exception {
  late String _message;
  late String _commandOutput;

  CommandInvalidOutput(
      {required String commandName, required String commandOutput}) {
    _message = "$commandName returned invalid response";
    _commandOutput = commandOutput;
  }

  @override
  String toString() {
    return "CommandInvalidResponse: $_message";
  }

  String getResponse() {
    return _commandOutput;
  }
}
