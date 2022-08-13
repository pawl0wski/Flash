class CantFindParameter implements Exception {
  final String parameter;

  CantFindParameter(this.parameter);

  @override
  String toString() {
    return "CantFindParameter: $parameter not exist in command output";
  }
}
