import 'package:flash/utils/commands/scrapers/models/scraped_command.dart';

class ScrapedPs extends ScrapedCommand {
  final List<PsEntry> entries;

  const ScrapedPs({required this.entries});

  PsEntry? getEntryByPid(int pid) {
    return entries.firstWhere((entry) => entry.pid == pid);
  }
}

class PsEntry {
  final int pid;
  final String command;

  const PsEntry({required this.pid, required this.command});

  String get executable {
    return _splitCommand.first;
  }

  String? get file {
    var argumentRegexp = RegExp(r"[-+]");
    return _splitCommand[1].startsWith(argumentRegexp)
        ? null
        : _splitCommand[1];
  }

  String get executableWithFile {
    return "$executable ${file ?? ""}".trimRight();
  }

  List<String> get _splitCommand => command.split(" ");
}
