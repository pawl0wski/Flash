import 'package:flash/utils/commands/command.dart';
import 'package:flash/utils/commands/scrapers/models/scraped_ps.dart';
import 'package:flash/utils/commands/scrapers/ps_scraper.dart';

class PsCommand extends Command {
  PsCommand()
      : super("ps",
            defaultArguments: ["-e", "-o", "pid,comm"],
            commandScraper: PsScrapper());

  @override
  ScrapedPs executeAndScrap(List<String> arguments) {
    return super.executeAndScrap(arguments) as ScrapedPs;
  }

  @override
  Future<ScrapedPs> executeAndScrapAsync(List<String> arguments) async {
    return super.executeAndScrapAsync(arguments) as ScrapedPs;
  }
}
