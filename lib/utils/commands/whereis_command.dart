import 'package:flash/utils/commands/command.dart';
import 'package:flash/utils/commands/scrapers/whereis_scraper.dart';
import 'package:flash/utils/commands/validators/whereis_validator.dart';
import 'package:flash/utils/process_adapter/process_adapter.dart';

import 'scrapers/models/scraped_whereis.dart';

class WhereisCommand extends Command {
  WhereisCommand({ProcessAdapter? processAdapter})
      : super("whereis",
            validator: WhereisCommandValidator(),
            processAdapter: processAdapter,
            commandScraper: WhereisScraper());

  @override
  ScrapedWhereis executeAndScrap(List<String> arguments) {
    return super.executeAndScrap(arguments) as ScrapedWhereis;
  }

  @override
  Future<ScrapedWhereis> executeAndScrapAsync(List<String> arguments) async {
    return super.executeAndScrapAsync(arguments) as ScrapedWhereis;
  }
}
