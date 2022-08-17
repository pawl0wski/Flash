class CantFindPsEntry implements Exception {
  final int pid;

  const CantFindPsEntry({required this.pid});

  @override
  String toString() {
    return "CantFindPsEntry: Cant find PsEntry for PID: $pid";
  }
}
