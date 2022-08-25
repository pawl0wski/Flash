part of 'games_bloc.dart';

abstract class GamesState extends Equatable {
  const GamesState();
}

class GamesStateLoading extends GamesState {
  const GamesStateLoading();

  @override
  List<Object?> get props => [];
}

class GamesStateLoaded extends GamesState {
  final List<Game> games;

  const GamesStateLoaded({required this.games});

  get isGamesEmpty => games.isEmpty;

  @override
  List<Object> get props => [games];
}

class GamesStateShowAddGameDialog extends GamesState {
  @override
  List<Object?> get props => [];
}

class GamesStateShowEditNameDialog extends GamesState {
  final Game gameToEdit;

  const GamesStateShowEditNameDialog(this.gameToEdit);

  @override
  List<Object?> get props => [gameToEdit];
}

class GamesStateShowChangeDisplayDialog extends GamesState {
  final Game gameToChangeDisplay;

  const GamesStateShowChangeDisplayDialog(this.gameToChangeDisplay);

  @override
  List<Object> get props => [gameToChangeDisplay];
}
