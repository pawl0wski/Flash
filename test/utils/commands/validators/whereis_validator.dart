import 'package:flash/utils/commands/validators/whereis_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("WhereisCommandValidator", () {
    late WhereisCommandValidator commandValidator;

    setUp(() {
      commandValidator = WhereisCommandValidator();
    });

    test("should return true if output is valid", () {
      const validOutput = "test: /bin/test";

      var isValidOutput = commandValidator.isValidOutput(validOutput);

      expect(isValidOutput, true);
    });

    test("should return true if output is invalid", () {
      const validOutput = "sh: command not found: whereis";

      var isValidOutput = commandValidator.isValidOutput(validOutput);

      expect(isValidOutput, false);
    });
  });
}
