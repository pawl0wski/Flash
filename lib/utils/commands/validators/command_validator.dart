import 'package:meta/meta.dart';

abstract class CommandValidator {
  CommandValidator();

  @protected
  String get commandName;

  bool isValidOutput(String commandOutput);
}
