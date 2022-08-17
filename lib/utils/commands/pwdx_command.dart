import 'package:flash/utils/commands/scrapers/models/scraped_pwdx.dart';
import 'package:flash/utils/commands/scrapers/pwdx_scraper.dart';
import 'package:flash/utils/commands/validators/pwdx_validator.dart';

import 'command.dart';

class PwdxCommand extends Command {
  PwdxCommand()
      : super(
          "pwdx",
          validator: PwdxValidator(),
          scraper: PwdxScraper(),
        );

  @override
  ScrapedPwdx executeAndScrap(List<String> arguments) {
    return super.executeAndScrap(arguments) as ScrapedPwdx;
  }

  @override
  Future<ScrapedPwdx> executeAndScrapAsync(List<String> arguments) async {
    return await super.executeAndScrapAsync(arguments) as ScrapedPwdx;
  }
}
