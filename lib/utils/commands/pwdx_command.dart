import 'package:flash/utils/commands/validators/pwdx_validator.dart';

import 'command.dart';

class PwdxCommand extends Command {
  PwdxCommand() : super("pwdx", validator: PwdxValidator());
}
