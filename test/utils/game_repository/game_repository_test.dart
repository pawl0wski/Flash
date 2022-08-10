import 'package:flash/utils/game_repository/hive_box/game_hive_box.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:uuid/uuid.dart';

import 'game_repository_test.mocks.dart';

@GenerateMocks([Uuid, GameHiveBox])
void main() {
  group("GameRepository", () {
    late MockGameHiveBox mockGameHiveBox;
    late MockUuid mockUuid;

    setUp(() {
      mockGameHiveBox = MockGameHiveBox();
      mockUuid = MockUuid();
    });
  });
}
