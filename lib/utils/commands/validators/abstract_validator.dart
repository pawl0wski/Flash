import 'package:meta/meta.dart';

abstract class AbstractCommandValidator {
  @protected
  final String commandName;

  AbstractCommandValidator({required this.commandName});

  bool isValidOutput(String commandOutput);
}
