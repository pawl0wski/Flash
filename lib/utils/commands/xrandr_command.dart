import 'package:flash/utils/commands/command.dart';
import 'package:flash/utils/process_adapter/process_adapter.dart';

class XRandrCommand extends Command {
  XRandrCommand({ProcessAdapter? processAdapter})
      : super("xrandr", processAdapter: processAdapter);

  List<String> getMonitors() {
    var commandOutput = super.execute(["--listmonitors"]);
    var splitCommandOutputs = commandOutput.split("\n").skip(1);
    return splitCommandOutputs.map((splitCommandOutput) {
      return splitCommandOutput.split(" ").last;
    }).toList();
  }
}
