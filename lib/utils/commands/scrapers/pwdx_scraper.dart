import './models/scraped_pwdx.dart';
import 'command_scraper.dart';

class PwdxScraper extends CommandScraper {
  @override
  ScrapedPwdx scrap(String commandOutput) {
    var pid = _getPidFromCommandOutput(commandOutput);
    var workingDirectory = _getWorkingDirectoryFromCommandOutput(commandOutput);
    return ScrapedPwdx(pid: pid, workingDirectory: workingDirectory);
  }

  int _getPidFromCommandOutput(String commandOutput) {
    var splitCommandOutput = _splitCommandOutput(commandOutput);
    return int.parse(splitCommandOutput.first);
  }

  String _getWorkingDirectoryFromCommandOutput(String commandOutput) {
    var splitCommandOutput = _splitCommandOutput(commandOutput);
    return splitCommandOutput.last;
  }

  List<String> _splitCommandOutput(String commandOutput) {
    return commandOutput.split(": ").toList();
  }
}
