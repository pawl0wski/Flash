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
  final Game game;

  const GamesStateShowEditNameDialog({required this.game});

  @override
  List<Object?> get props => [game];
}
