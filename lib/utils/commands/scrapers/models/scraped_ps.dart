import 'package:flash/utils/commands/scrapers/models/scraped_command.dart';

class ScrapedPs extends ScrapedCommand {
  final List<PsEntry> entries;

  const ScrapedPs({required this.entries});
}

class PsEntry {
  final int pid;
  final String command;

  const PsEntry({required this.pid, required this.command});
}
