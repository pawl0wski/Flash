import 'package:flash/utils/commands/scrapers/models/scraped_command.dart';
import 'package:flash/utils/process_adapter/process_adapter.dart';
import 'package:meta/meta.dart';

import 'exceptions/command_invalid_output.dart';
import 'exceptions/scraper_not_provided.dart';
import 'scrapers/command_scraper.dart';
import 'validators/command_validator.dart';

abstract class Command {
  @protected
  final String commandName;
  final CommandValidator? _validator;
  final ProcessAdapter _processAdapter;
  final CommandScraper? _scraper;
  final List<String> _defaultArguments;

  Command(this.commandName,
      {CommandValidator? validator,
      ProcessAdapter? processAdapter,
      CommandScraper? scraper,
      List<String> defaultArguments = const []})
      : _validator = validator,
        _processAdapter = processAdapter ?? ProcessAdapter(),
        _scraper = scraper,
        _defaultArguments = defaultArguments;

  String execute(List<String> arguments) {
    var commandOutput = _processAdapter.execute(
        commandName, _mixArgumentsWithDefaultArguments(arguments));
    _throwExceptionIfOutputIsInvalid(commandOutput);
    return commandOutput;
  }

  ScrapedCommand executeAndScrap(List<String> arguments) {
    var commandOutput = execute(arguments);
    _throwExceptionIfScraperIsNotProvided();
    return _scraper!.scrap(commandOutput);
  }

  Future<String> executeAsync(List<String> arguments) async {
    var commandOutput = await _processAdapter.executeAsync(
        commandName, _mixArgumentsWithDefaultArguments(arguments));
    _throwExceptionIfOutputIsInvalid(commandOutput);
    return commandOutput;
  }

  Future<ScrapedCommand> executeAndScrapAsync(List<String> arguments) async {
    var commandOutput = await executeAsync(arguments);
    _throwExceptionIfScraperIsNotProvided();
    return _scraper!.scrap(commandOutput);
  }

  bool _isValidatorNotNullAndOutputIsInvalid(String commandOutput) {
    return (_validator != null && !_validator!.isValidOutput(commandOutput));
  }

  List<String> _mixArgumentsWithDefaultArguments(List<String> arguments) {
    return [..._defaultArguments, ...arguments];
  }

  _throwExceptionIfOutputIsInvalid(String commandOutput) {
    if (_isValidatorNotNullAndOutputIsInvalid(commandOutput)) {
      throw CommandInvalidOutput(
          commandName: commandName, commandOutput: commandOutput);
    }
  }

  _throwExceptionIfScraperIsNotProvided() {
    if (_scraper == null) {
      throw ScraperNotProvided(executorName: _getCurrentClassName());
    }
  }

  String _getCurrentClassName() {
    return runtimeType.toString();
  }
}
