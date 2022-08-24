import 'package:flash/utils/commands/xrandr_command.dart';
import 'package:flash/utils/process_adapter/process_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'xrandr_command_test.mocks.dart';

@GenerateMocks([ProcessAdapter])
void main() {
  group("XrandrCommand", () {
    late MockProcessAdapter mockProcessAdapter;
    late XRandrCommand xRandrCommand;
    setUp(() {
      mockProcessAdapter = MockProcessAdapter();
      xRandrCommand = XRandrCommand(processAdapter: mockProcessAdapter);
    });

    test("should get monitors", () {
      configureProcessAdapterMockToReturnMonitors(mockProcessAdapter);

      var monitors = xRandrCommand.getMonitors();

      expect(monitors, ["HDMI-0", "HDMI-1"]);
    });
  });
}

void configureProcessAdapterMockToReturnMonitors(
    MockProcessAdapter mockProcessAdapter) {
  when(mockProcessAdapter.execute("xrandr", ["--listmonitors"])).thenReturn(
      "Monitors: 2\n0: +*HDMI-0 1920/527x1080/296+0+0  HDMI-0\n1: +HDMI-1 1920/544x1080/303+1920+0  HDMI-1");
}
