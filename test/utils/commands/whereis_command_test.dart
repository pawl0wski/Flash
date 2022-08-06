import 'package:flash/utils/commands/whereis_command.dart';
import 'package:flash/utils/process_adapter/process_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'whereis_command_test.mocks.dart';

@GenerateMocks([ProcessAdapter])
void main() {
  group("WhereisCommand", () {
    late MockProcessAdapter processAdapter;
    setUp(() {
      processAdapter = MockProcessAdapter();
    });

    test("should return command output if everything went fine", () {
      var whereis = WhereisCommand(processAdapter: processAdapter);

      configureMockProcessAdapterToReturnValidValue(processAdapter);
      var commandOutput = whereis.execute(["test"]);

      expect(commandOutput, "test: /bin/test");
    });
  });
}

configureMockProcessAdapterToReturnValidValue(
    MockProcessAdapter mockProcessAdapter) {
  when(mockProcessAdapter.execute("whereis", any)).thenAnswer((realInvocation) {
    List<String> commandArguments = realInvocation.positionalArguments.last;
    String commandBeingSearchedFor = commandArguments.last;
    return "$commandBeingSearchedFor: /bin/$commandBeingSearchedFor";
  });
}
