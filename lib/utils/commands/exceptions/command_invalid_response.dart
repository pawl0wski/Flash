class CommandInvalidResponse implements Exception {
  late String _message;
  late String _response;

  CommandInvalidResponse(
      {required String commandName, required String response}) {
    _message = "$commandName returned invalid response";
    _response = response;
  }

  @override
  String toString() {
    return "CommandInvalidResponse: $_message";
  }

  String getResponse() {
    return _response;
  }
}
