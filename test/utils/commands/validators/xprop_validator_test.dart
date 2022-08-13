import 'package:flash/utils/commands/validators/xprop_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("XPropValidator", () {
    late XPropValidator commandValidator;

    setUp(() {
      commandValidator = XPropValidator();
    });

    test("should return true if output is valid", () {
      const validOutput =
          "_NET_WM_OPAQUE_REGION(CARDINAL) = 0, 0, 1920, 1080\n_NET_TEST = test";

      var isValidOutput = commandValidator.isValidOutput(validOutput);

      expect(isValidOutput, true);
    });

    test("should return false if output is invalid", () {
      const validOutput = "sh: command not found: xprop";

      var isValidOutput = commandValidator.isValidOutput(validOutput);

      expect(isValidOutput, false);
    });
  });
}
