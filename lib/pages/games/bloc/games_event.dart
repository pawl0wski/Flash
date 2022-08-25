part of 'games_bloc.dart';

abstract class GamesEvent extends Equatable {
  const GamesEvent();
}

class GamesEventLoadGames extends GamesEvent {
  @override
  List<Object?> get props => [];
}

class GamesEventShowAddGameDialog extends GamesEvent {
  @override
  List<Object?> get props => [];
}

class GamesBlocEventDeleteGame extends GamesEvent {
  final Game gameToDelete;

  const GamesBlocEventDeleteGame(this.gameToDelete);

  @override
  List<Object?> get props => [gameToDelete];
}

class GamesBlocEventEditGameName extends GamesEvent {
  final Game gameToEdit;

  const GamesBlocEventEditGameName(this.gameToEdit);

  @override
  List<Object?> get props => [gameToEdit];
}

class GamesBlocEventChangeDisplay extends GamesEvent {
  final Game gameToChangeDisplay;

  const GamesBlocEventChangeDisplay(this.gameToChangeDisplay);

  @override
  List<Object?> get props => [gameToChangeDisplay];
}
