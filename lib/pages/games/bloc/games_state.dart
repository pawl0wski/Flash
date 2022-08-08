part of 'games_bloc.dart';

abstract class GamesState extends Equatable {
  const GamesState();
}

class GamesInitial extends GamesState {
  @override
  List<Object> get props => [];
}
