class RepositoryUpdateException implements Exception {
  final String _message;

  const RepositoryUpdateException(String? message)
      : _message = message ?? "Can't update HiveObject";

  @override
  String toString() {
    return "RepositoryUpdateException: $_message";
  }
}
