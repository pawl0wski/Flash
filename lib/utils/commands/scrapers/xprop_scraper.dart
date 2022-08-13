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
    var parameterRegrex = RegExp("$parameter = .*\n");
    if (parameterRegrex.hasMatch(commandOutput)) {
      var parameterMatch = parameterRegrex.firstMatch(commandOutput)!;
      var parameterValue = parameterMatch.group(0)!.split(" = ");
      return parameterValue;
    }
    throw CantFindParameter(parameter);
  }
}
