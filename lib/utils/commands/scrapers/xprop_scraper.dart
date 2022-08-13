import 'package:flash/utils/commands/exceptions/cant_find_parameter.dart';
import 'package:flash/utils/commands/scrapers/command_scraper.dart';
import 'package:flash/utils/commands/scrapers/models/scraped_xprop.dart';

class XPropScraper extends CommandScraper {
  @override
  ScrapedXProp scrap(String commandOutput) {
    var pid = _scrapPid(commandOutput);
    return ScrapedXProp(pid: pid);
  }

  int _scrapPid(String commandOutput) {
    var pid = _getParameterValue(commandOutput, "_NET_WM_PID(CARDINAL)");
    return int.parse(pid);
  }

  _getParameterValue(String commandOutput, String parameter) {
    var parameterRegrex = RegExp(r".* = .*");
    if (parameterRegrex.hasMatch(commandOutput)) {
      var regrexMatches = parameterRegrex.allMatches(commandOutput).toList();
      var entries = _convertMatchesToEntries(regrexMatches);
      var correctEntry =
          _getEntryWhichStartsWithTheParameter(entries, parameter);
      if (correctEntry != null) {
        return correctEntry.split(" = ").last;
      }
    }
    throw CantFindParameter(parameter);
  }

  Iterable<String> _convertMatchesToEntries(Iterable<RegExpMatch> entries) {
    return entries.map((RegExpMatch e) => e.group(0) as String);
  }

  String? _getEntryWhichStartsWithTheParameter(
      Iterable<String> entries, String parameter) {
    for (var entry in entries) {
      if (entry.startsWith(parameter)) {
        return entry;
      }
    }
    return null;
  }
}
