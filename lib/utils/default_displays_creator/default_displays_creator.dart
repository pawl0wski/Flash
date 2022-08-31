import 'package:flash/utils/repository/display_repository.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:flash/utils/repository/models/rgb.dart';

class DefaultDisplaysCreator {
  final DisplayRepository _displayRepository;

  DefaultDisplaysCreator({DisplayRepository? displayRepository})
      : _displayRepository = displayRepository ?? DisplayRepository();

  void create() {
    _createBrightDisplayIfNotExist();
    _createVeryBrightDisplayIfNotExist();
    _createDarkDisplayIfNotExist();
  }

  _createBrightDisplayIfNotExist() {
    if (!_checkIfReadOnlyDisplayExist("Bright")) {
      _displayRepository.add(Display(
          brightness: 1,
          rgb: RGB.fromGamma(2),
          name: 'Bright',
          readOnly: true));
    }
  }

  _createVeryBrightDisplayIfNotExist() {
    if (!_checkIfReadOnlyDisplayExist("Very Bright")) {
      _displayRepository.add(Display(
          brightness: 1,
          rgb: RGB.fromGamma(2.5),
          name: 'Very Bright',
          readOnly: true));
    }
  }

  _createDarkDisplayIfNotExist() {
    if (!_checkIfReadOnlyDisplayExist("Dark")) {
      _displayRepository.add(Display(
          brightness: 1,
          rgb: RGB.fromGamma(0.5),
          name: 'Dark',
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
