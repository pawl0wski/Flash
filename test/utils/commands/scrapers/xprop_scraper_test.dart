import 'package:flash/utils/commands/exceptions/cant_find_parameter.dart';
import 'package:flash/utils/commands/scrapers/xprop_scraper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("XPropScraper", () {
    test("should scrap correct output", () {
      const correctOutput = "_NET_WM_PID(CARDINAL) = 10\n_NET_TEST = 10\n";

      var scrapedXProp = XPropScraper().scrap(correctOutput);

      expect(scrapedXProp.pid, 10);
    });

    test("should throw exception if can't find parameter", () {
      const outputWithoutParameter = "_NET_TEST = 22\n_NET_ABC = abc\n";

      expect(() => XPropScraper().scrap(outputWithoutParameter),
          throwsA(isA<CantFindParameter>()));
    });
  });
}
