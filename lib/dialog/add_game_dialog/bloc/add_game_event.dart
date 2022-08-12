part of 'add_game_bloc.dart';

@immutable
abstract class AddGameEvent extends Equatable {}

class AddGameEventShowClickOnGame extends AddGameEvent {
  @override
  List<Object?> get props => [];
}
