import './models/scraped_command.dart';

abstract class CommandScraper {
  ScrapedCommand scrap(String commandOutput);
}
