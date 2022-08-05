class WhereisInvalidResponseException implements Exception {
  final _message = "whereis returned invalid response";
  final String _response;

  WhereisInvalidResponseException(String response) : _response = response;

  @override
  String toString() {
    return "WhereisInvalidResponseException: $_message";
  }
}
