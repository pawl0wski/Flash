class CantFindWindow implements Exception {
  @override
  String toString() {
    return "CantFindWindow: Can't find any window using provided PID";
  }
}
