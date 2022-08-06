import 'package:meta/meta.dart';

abstract class AbstractCommandValidator {
  AbstractCommandValidator();

  @protected
  String get commandName;

  bool isValidOutput(String commandOutput);
}
