class GameUpdateException implements Exception {
  final String _message;

  const GameUpdateException(String? message)
      : _message = message ?? "Can't update Game";

  @override
  String toString() {
    return "GameUpdateException: $_message";
  }
}
