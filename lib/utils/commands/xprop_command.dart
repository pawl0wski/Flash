import 'package:flash/utils/commands/command.dart';
import 'package:flash/utils/commands/scrapers/models/scraped_xprop.dart';
import 'package:flash/utils/commands/scrapers/xprop_scraper.dart';
import 'package:flash/utils/commands/validators/xprop_validator.dart';
import 'package:flash/utils/process_adapter/process_adapter.dart';

class XPropCommand extends Command {
  XPropCommand({ProcessAdapter? processAdapter})
      : super("xprop",
            processAdapter: processAdapter,
            commandScraper: XPropScraper(),
            validator: XPropValidator());

  @override
  ScrapedXProp executeAndScrap(List<String> arguments) {
    return super.executeAndScrap(arguments) as ScrapedXProp;
  }
}
