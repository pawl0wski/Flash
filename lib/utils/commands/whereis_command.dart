import 'package:flash/utils/commands/abstract_command.dart';
import 'package:flash/utils/commands/validators/whereis_validator.dart';
import 'package:flash/utils/process_adapter/process_adapter.dart';

class WhereisCommand extends Command {
  WhereisCommand({ProcessAdapter? processAdapter})
      : super("whereis",
            validator: WhereisCommandValidator(),
            processAdapter: processAdapter);
}
