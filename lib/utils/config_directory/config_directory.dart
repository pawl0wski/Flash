import 'dart:io';

import 'package:path/path.dart' as p;

class ConfigDirectory {
  final _localShare = "~/.local/share/";
  late String _appName;
  late Directory _directory;

  ConfigDirectory({
    required String appName,
    Directory? directory,
  }) {
    _appName = appName;
    _directory = directory ?? Directory(p.join(_localShare, _appName));
  }

  createDirectoryIfNotExists() {
    if (!isDirectoryExist()) {
      createDirectory();
    }
  }

  createDirectory() {
    _directory.createSync();
  }

  bool isDirectoryExist() {
    return _directory.existsSync();
  }
}
