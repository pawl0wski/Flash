import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  GamesBloc() : super(const GamesState(games: [])) {
    on<GamesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
