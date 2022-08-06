import 'package:flash/utils/commands/scrapers/models/scraped_whereis.dart';

import 'command_scraper.dart';

class WhereisScraper extends CommandScraper {
  @override
  ScrapedWhereis scrap(String commandOutput) {
    var commandPaths = _scrapPathsOfCommandFrom(commandOutput);
    var commandName = _scrapCommandNameFrom(commandOutput);
    return _assembleScrapedWhereisUsing(
        commandPaths: commandPaths, commandName: commandName);
  }

  List<String> _scrapPathsOfCommandFrom(String commandOutput) {
    // Get second split of whereis command
    // "executable: /bin/executable /usr/bin/executable" -> "/bin/executable /usr/bin/executable"
    var secondSplitOfCommandOutput = commandOutput.split(": ").last;
    if (secondSplitOfCommandOutput.isEmpty) {
      return [];
    }
    // Split locations by space
    // "/bin/executable /usr/bin/executable" -> ["/bin/executable", "/usr/bin/executable"]
    var locations = secondSplitOfCommandOutput.split(" ");
    return locations;
  }

  String _scrapCommandNameFrom(String commandOutput) {
    var firstSplitOfCommandOutput = commandOutput.split(":").first;
    return firstSplitOfCommandOutput;
  }

  ScrapedWhereis _assembleScrapedWhereisUsing(
      {required List<String> commandPaths, required String commandName}) {
    return ScrapedWhereis(commandPaths: commandPaths, commandName: commandName);
  }
}
