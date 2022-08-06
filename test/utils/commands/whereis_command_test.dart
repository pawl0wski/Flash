import 'package:flash/utils/commands/exceptions/command_invalid_output.dart';
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
    late WhereisCommand whereis;

    setUp(() {
      processAdapter = MockProcessAdapter();
      whereis = WhereisCommand(processAdapter: processAdapter);
    });

    test("should return command output if everything went fine", () {
      configureMockProcessAdapterToReturnValidValue(processAdapter);

      var commandOutput = whereis.execute(["test"]);

      expect(commandOutput, "test: /bin/test");
    });

    test("should throw exception if can't find whereis", () {
      configureMockProcessAdapterToReturnWhereisNotFound(processAdapter);

      expect(() => whereis.execute(["test"]),
          throwsA(isA<CommandInvalidOutput>()));
    });

    test("should return scraped output if everything went fine", () {
      configureMockProcessAdapterToReturnValidValue(processAdapter);

      var scrapedOutput = whereis.executeAndScrap(["test"]);

      expect(scrapedOutput.commandName, "test");
      expect(scrapedOutput.commandPaths, ["/bin/test"]);
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

configureMockProcessAdapterToReturnWhereisNotFound(
    MockProcessAdapter mockProcessAdapter) {
  when(mockProcessAdapter.execute("whereis", any))
      .thenReturn("sh: command not found: test");
}
