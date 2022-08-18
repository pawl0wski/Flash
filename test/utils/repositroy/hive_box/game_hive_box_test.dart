import 'package:flash/utils/repository/hive_box/game_hive_box.dart';
import 'package:flash/utils/repository/models/game.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'game_hive_box_test.mocks.dart';

@GenerateMocks([HiveInterface, Box])
void main() {
  group("GameHiveBox", () {
    late MockHiveInterface mockHiveInterface = MockHiveInterface();

    tearDown(() {
      reset(mockHiveInterface);
      GameHiveBox().resetBox();
    });

    test("should create new box if static private value is null", () {
      _configureToReturnMockBox(mockHiveInterface);

      _getBoxNTimes(mockHiveInterface, n: 1);

      _verifyThatTheBoxWasRetrievedFromHiveInterfaceOneTime(mockHiveInterface);
    });

    test("The box should only be obtained from HiveInterface once", () {
      _configureToReturnMockBox(mockHiveInterface);

      _getBoxNTimes(mockHiveInterface, n: 10);

      _verifyThatTheBoxWasRetrievedFromHiveInterfaceOneTime(mockHiveInterface);
    });
  });
}

_configureToReturnMockBox(MockHiveInterface mockHiveInterface) {
  when(mockHiveInterface.box("games")).thenReturn(MockBox<Game>());
}

Box<Game> _getBoxNTimes(MockHiveInterface mockHiveInterface, {required int n}) {
  late Box<Game> returnedBox;
  for (num i = 0; i < n; i++) {
    returnedBox = GameHiveBox(hive: mockHiveInterface).box;
  }
  return returnedBox;
}

_verifyThatTheBoxWasRetrievedFromHiveInterfaceOneTime(
    MockHiveInterface mockHiveInterface) {
  verify(mockHiveInterface.box("games")).called(1);
}
