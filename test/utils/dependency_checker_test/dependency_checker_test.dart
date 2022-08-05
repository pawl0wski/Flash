import 'package:flash/utils/commands/whereis_command.dart';
import 'package:flash/utils/dependency_checker/dependency_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dependency_checker_test.mocks.dart';

@GenerateMocks([WhereisCommand])
void main() {
  group("DependencyChecker", () {
    late MockWhereisCommand mockWhereis;
    late DependencyChecker dependencyChecker;

    setUp(() {
      mockWhereis = MockWhereisCommand();
      dependencyChecker = DependencyChecker(commandExecutor: mockWhereis);
    });

    test("should return false if the dependency not exists", () {
      configureToReturnValueThatSaysItNotExists(mockWhereis);

      expect(dependencyChecker.checkIfExists("application"), false);
    });

    test("should return true if dependency exists", () {
      configureToReturnValueThatSaysItExists(mockWhereis);

      expect(dependencyChecker.checkIfExists("application"), true);
    });
  });
}

void configureToReturnValueThatSaysItNotExists(MockWhereisCommand mockWhereIs) {
  when(mockWhereIs.execute(["application"])).thenReturn("application: ");
}

void configureToReturnValueThatSaysItExists(MockWhereisCommand mockWhereIs) {
  when(mockWhereIs.execute(["application"]))
      .thenReturn("application: /bin/application /usr/bin/application");
}
