import 'package:flash/utils/game_repository/game_repository.dart';
import 'package:flash/utils/game_repository/hive_box/game_hive_box.dart';
import 'package:flash/utils/game_repository/models/game.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'game_repository_test.mocks.dart';

@GenerateMocks([Uuid, GameHiveBox, Box])
void main() {
  group("GameRepository", () {
    late MockGameHiveBox mockGameHiveBox;
    late MockUuid mockUuid;
    late MockBox<Game> mockBox;

    setUp(() {
      mockGameHiveBox = MockGameHiveBox();
      mockUuid = MockUuid();
      mockBox = MockBox<Game>();
    });

    test("getAllGames should get all games from box", () {
      var testGames = _createTestGames();
      _configureMockGameHiveBoxToReturnMockBox(
          mockBox: mockBox, mockGameHiveBox: mockGameHiveBox);
      _configureMockBoxToReturnTestGames(mockBox: mockBox);

      var allGames = GameRepository(gameHiveBox: mockGameHiveBox).getAllGames();

      expect(allGames.length, 2);
      expect(testGames["uuid1"], isIn(allGames));
    });
  });
}

void _configureMockGameHiveBoxToReturnMockBox(
    {required MockGameHiveBox mockGameHiveBox,
    required MockBox<Game> mockBox}) {
  when(mockGameHiveBox.box).thenReturn(mockBox);
}

void _configureMockBoxToReturnTestGames({required MockBox<Game> mockBox}) {
  var testGames = _createTestGames();
  when(mockBox.keys).thenReturn(testGames.keys);
  when(mockBox.get(any)).thenAnswer((realInvocation) {
    var gameUuid = realInvocation.positionalArguments.first;
    return testGames[gameUuid];
  });
}

Map<String, Game> _createTestGames() {
  var firstGame = _createTestGame("firstgame");
  var secondGame = _createTestGame("secondGame");
  return {"uuid1": firstGame, "uuid2": secondGame};
}

Game _createTestGame(String gameName) {
  var game = Game();
  game.name = gameName;
  game.processName = gameName;
  return game;
}
