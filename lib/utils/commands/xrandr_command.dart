import 'package:flash/utils/commands/command.dart';
import 'package:flash/utils/process_adapter/process_adapter.dart';
import 'package:flash/utils/repository/models/display.dart';

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

  void changeDisplay({required Display display, required String monitor}) {
    var rgb = display.rgb;
    List<String> displayRGBasList = [
      rgb.r.toString(),
      rgb.g.toString(),
      rgb.b.toString()
    ];
    super.execute([
      "-d",
      monitor,
      "--gamma",
      ...displayRGBasList,
      "--brightness",
      display.brightness.toString()
    ]);
  }
}
