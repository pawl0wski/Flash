import 'package:flash/utils/commands/scrapers/models/scraped_command.dart';

class ScrapedPwdx extends ScrapedCommand {
  final int pid;
  final String workingDirectory;

  ScrapedPwdx({required this.pid, required this.workingDirectory});
}
