import './models/scraped_pwdx.dart';
import 'command_scraper.dart';

class PwdxScraper extends CommandScraper {
  @override
  ScrapedPwdx scrap(String commandOutput) {
    commandOutput = _removeNewLineFrom(commandOutput);
    var pid = _getPidFrom(commandOutput);
    var workingDirectory = _getWorkingDirectoryFrom(commandOutput);
    return ScrapedPwdx(pid: pid, workingDirectory: workingDirectory);
  }

  int _getPidFrom(String commandOutput) {
    var splitCommandOutput = _splitCommandOutput(commandOutput);
    return int.parse(splitCommandOutput.first);
  }

  String _getWorkingDirectoryFrom(String commandOutput) {
    var splitCommandOutput = _splitCommandOutput(commandOutput);
    return splitCommandOutput.last;
  }

  String _removeNewLineFrom(String commandOutput) {
    return commandOutput.replaceFirst("\n", "");
  }

  List<String> _splitCommandOutput(String commandOutput) {
    return commandOutput.split(": ").toList();
  }
}
