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
