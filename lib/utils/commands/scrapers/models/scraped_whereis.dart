import 'scraped_command.dart';

class ScrapedWhereis extends ScrapedCommand {
  List<String> commandPaths;
  String commandName;

  ScrapedWhereis({required this.commandPaths, required this.commandName});

  get commandExist => commandPaths.isNotEmpty;
}
