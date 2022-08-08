part of 'games_bloc.dart';

class GamesState extends Equatable {
  final List games;

  const GamesState({required this.games});

  get isGamesEmpty => games.isEmpty;

  @override
  List<Object> get props => [games];
}
