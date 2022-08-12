import 'dart:io';

import 'package:flash/utils/config_directory/config_directory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

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

    test("createDirectory should create directory", () {
      _configureMockDirectoryToCreateDirectory(mockDirectory: mockDirectory);

      configDirectory.createDirectory();

      verify(mockDirectory.createSync()).called(1);
    });

    test("createDirectoryIfNotExist should create directory if not exist", () {
      _configureMockDirectoryToCreateDirectory(mockDirectory: mockDirectory);
      _configureMockDirectoryToNotExist(mockDirectory: mockDirectory);

      configDirectory.createDirectoryIfNotExists();

      verify(mockDirectory.createSync()).called(1);
    });

    test("createDirectoryIfNotExist should not create directory if exist", () {
      _configureMockDirectoryToCreateDirectory(mockDirectory: mockDirectory);
      _configureMockDirectoryToExist(mockDirectory: mockDirectory);

      configDirectory.createDirectoryIfNotExists();

      verifyNever(mockDirectory.createSync());
    });
  });
}

_configureMockDirectoryToCreateDirectory(
    {required MockDirectory mockDirectory}) {
  when(mockDirectory.createSync()).thenAnswer((realInvocation) {});
}

_configureMockDirectoryToNotExist({required MockDirectory mockDirectory}) {
  when(mockDirectory.existsSync()).thenReturn(false);
}

_configureMockDirectoryToExist({required MockDirectory mockDirectory}) {
  when(mockDirectory.existsSync()).thenReturn(true);
}
