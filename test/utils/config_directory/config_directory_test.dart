import 'dart:io';

import 'package:flash/utils/config_directory/config_directory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'config_directory_test.mocks.dart';

@GenerateMocks([Directory])
void main() {
  group("ConfigDirectoryTest", () {
    late MockDirectory mockDirectory;
    late ConfigDirectory configDirectory;
    setUp(() {
      mockDirectory = MockDirectory();
      configDirectory =
          ConfigDirectory(appName: "testApp", directory: mockDirectory);
    });
  });
}
