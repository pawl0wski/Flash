import 'package:flash/utils/repository/display_repository.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:flash/utils/repository/models/rgb.dart';

class DefaultDisplaysCreator {
  final DisplayRepository _displayRepository;

  DefaultDisplaysCreator({DisplayRepository? displayRepository})
      : _displayRepository = displayRepository ?? DisplayRepository();

  void create() {
    _createBrightDisplayIfNotExist();
  }

  _createBrightDisplayIfNotExist() {
    if (!_checkIfReadOnlyDisplayExist("Bright")) {
      _displayRepository.add(Display(
          brightness: 1,
          rgb: RGB.fromGamma(2.4),
          name: 'Bright',
          readOnly: true));
    }
  }

  _checkIfReadOnlyDisplayExist(String displayName) {
    for (var display in _displayRepository.getAll()) {
      if (display.readOnly == true && display.name == displayName) {
        return true;
      }
    }
    return false;
  }
}
