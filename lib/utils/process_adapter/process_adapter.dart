import 'dart:io';

/*
  This ProcessAdapter was implemented to allow unit testing.
  Mockito can't mock static methods.
 */
class ProcessAdapter {
  String execute(String command, List<String> arguments) {
    var output = Process.runSync(command, arguments);
    return output.stdout;
  }

  Future<String> executeAsync(String command, List<String> arguments) async {
    var output = await Process.run(command, arguments);
    return output.stdout;
  }
}
