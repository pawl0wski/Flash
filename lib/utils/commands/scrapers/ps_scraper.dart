import 'package:flash/utils/commands/scrapers/models/scraped_ps.dart';

import 'command_scraper.dart';

class PsScrapper extends CommandScraper {
  @override
  ScrapedPs scrap(String commandOutput) {
    var separatedOutput = _separateOutputAndRemoveFirstLine(commandOutput);
    var entries = _makeEntriesFromSeparatedOutput(separatedOutput);
    return ScrapedPs(entries: entries);
  }

  List<String> _separateOutputAndRemoveFirstLine(String commandOutput) {
    var separatedOutput = commandOutput.split("\n").toList();
    var separatedOutputWithoutFirstLine = separatedOutput.sublist(1);
    return separatedOutputWithoutFirstLine;
  }

  List<PsEntry> _makeEntriesFromSeparatedOutput(List<String> separatedOutput) {
    List<PsEntry> entries = [];
    for (String line in separatedOutput) {
      var splitLine = _splitLineBySpaces(line);
      entries
          .add(PsEntry(pid: int.parse(splitLine[1]), command: splitLine.last));
    }
    return entries;
  }

  List<String> _splitLineBySpaces(String line) {
    var spaceRegexp = RegExp(r" +");
    line.replaceAll(spaceRegexp, "|");
    return line.split("|").toList();
  }
}
