import 'package:flash/utils/command_executor/command_executor.dart';
import 'package:flash/utils/dependency_checker/dependency_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dependency_checker_test.mocks.dart';

@GenerateMocks([CommandExecutor])
void main() {
  group("DependencyChecker", () {
    late MockCommandExecutor mockCommandExecutor;
    late DependencyChecker dependencyChecker;

    setUp(() {
      mockCommandExecutor = MockCommandExecutor();
      dependencyChecker =
          DependencyChecker(commandExecutor: mockCommandExecutor);
    });

    test("should return false if the dependency not exists", () {
      configureToReturnValueThatSaysItNotExists(mockCommandExecutor);

      expect(dependencyChecker.checkIfExists("application"), false);
    });

    test("should return true if dependency exists", () {
      configureToReturnValueThatSaysItExists(mockCommandExecutor);

      expect(dependencyChecker.checkIfExists("application"), true);
    });
  });
}

void configureToReturnValueThatSaysItNotExists(
    MockCommandExecutor mockCommandExecutor) {
  when(mockCommandExecutor.execute)
      .thenReturn((executable, arguments) => "$executable: ");
}

void configureToReturnValueThatSaysItExists(
    MockCommandExecutor mockCommandExecutor) {
  when(mockCommandExecutor.execute).thenReturn((executable, arguments) =>
      "$executable: /bin/$executable, /usr/bin/$executable");
}
