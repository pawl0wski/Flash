import 'package:flash/utils/commands/scrapers/whereis_scraper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("WhereisScraper", () {
    test("should collect one command path", () {
      const outputWithOnePath = "test: /bin/test";

      var commandPaths = scrapAndCollectCommandPaths(outputWithOnePath);

      expect(commandPaths.length, 1);
      expect(commandPaths.first, "/bin/test");
    });

    test("should collect two command paths", () {
      const outputWithTwoPaths = "test: /bin/test /usr/bin/test";

      var commandPaths = scrapAndCollectCommandPaths(outputWithTwoPaths);

      expect(commandPaths.length, 2);
      expect(commandPaths.first, "/bin/test");
      expect(commandPaths.last, "/usr/bin/test");
    });

    test("should return zero command paths", () {
      const outputWithoutPaths = "test: ";

      var commandPaths = scrapAndCollectCommandPaths(outputWithoutPaths);

      expect(commandPaths.length, 0);
    });
  });
}

List<String> scrapAndCollectCommandPaths(String commandOutput) {
  var scrapedOutput = WhereisScraper().scrap(commandOutput);
  return scrapedOutput.commandPaths;
}
