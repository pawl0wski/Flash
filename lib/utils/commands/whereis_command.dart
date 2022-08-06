import 'package:flash/utils/commands/abstract_command.dart';
import 'package:flash/utils/process_adapter/process_adapter.dart';

import 'validators/abstract_validator.dart';

class WhereisCommand extends Command {
  WhereisCommand(
      {AbstractCommandValidator? validator, ProcessAdapter? processAdapter})
      : super("whereis", validator: validator, processAdapter: processAdapter);
}
