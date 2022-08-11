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
    late GameRepository gameRepository;

    setUp(() {
      mockGameHiveBox = MockGameHiveBox();
      mockUuid = MockUuid();
      mockBox = MockBox<Game>();
      gameRepository =
          GameRepository(gameHiveBox: mockGameHiveBox, uuid: mockUuid);
      _configureMockGameHiveBoxToReturnMockBox(
          mockBox: mockBox, mockGameHiveBox: mockGameHiveBox);
    });

    test("getAllGames should get all games from box", () {
      var testGames = _createTestGames();
      _configureMockBoxToReturnTestGames(mockBox: mockBox);

      var allGames = gameRepository.getAllGames();

      expect(allGames.length, 2);
      expect(testGames["uuid1"], isIn(allGames));
    });

    test("deleteGame should delete game from box", () {
      _configureMockBoxToDelete("testGame", mockBox: mockBox);

      gameRepository.deleteGame("testGame");

      verify(mockBox.delete("testGame")).called(1);
    });

    test("addGameAndReturnUuid should add game to box", () {
      var fakeUuid = "fakeUuid";
      _configureMockUuidToGenerateFakeUuid(fakeUuid, mockUuid: mockUuid);
      _configureMockBoxToPutGame(mockBox: mockBox);
      var testGame = _createTestGame("testGame");

      var testGameUuid = gameRepository.addGameAndReturnGameUuid(testGame);

      expect(testGameUuid, fakeUuid);
      expect(testGame.uuid, fakeUuid);
      verify(mockBox.put(fakeUuid, testGame)).called(1);
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

void _configureMockBoxToDelete(String gameName,
    {required MockBox<Game> mockBox}) {
  when(mockBox.delete(gameName)).thenAnswer((realInvocation) async => {});
}

void _configureMockBoxToPutGame({required MockBox<Game> mockBox}) {
  when(mockBox.put(any, any)).thenAnswer((realInvocation) async => {});
}

void _configureMockUuidToGenerateFakeUuid(String fakeUuid,
    {required MockUuid mockUuid}) {
  when(mockUuid.v4()).thenReturn(fakeUuid);
}

Map<String, Game> _createTestGames() {
  var firstGame = _createTestGame("firstGame");
  var secondGame = _createTestGame("secondGame");
  return {"uuid1": firstGame, "uuid2": secondGame};
}

Game _createTestGame(String gameName) {
  var game = Game();
  game.name = gameName;
  game.processName = gameName;
  return game;
}
