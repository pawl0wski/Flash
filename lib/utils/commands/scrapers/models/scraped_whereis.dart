import 'scraped_command.dart';

class ScrapedWhereis extends ScrapedCommand {
  final List<String> commandPaths;
  final String commandName;

  const ScrapedWhereis({required this.commandPaths, required this.commandName});

  get commandExist => commandPaths.isNotEmpty;
}
