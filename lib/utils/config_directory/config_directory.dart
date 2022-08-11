import 'dart:io';

import 'package:path/path.dart' as p;

class ConfigDirectory {
  final _localShare = "~/.local/share/";
  final String _appName;

  ConfigDirectory({required String appName}) : _appName = appName;

  get _directory => Directory(p.join(_localShare, _appName));

  createDirectoryIfNotExists() {
    if (isDirectoryExist()) {
      createDirectory();
    }
  }

  createDirectory() {
    _directory.createSync();
  }

  isDirectoryExist() {
    _directory.existsSync();
  }
}
