import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_game_event.dart';
part 'add_game_state.dart';

class AddGameBloc extends Bloc<AddGameEvent, AddGameState> {
  AddGameBloc() : super(AddGameInitial()) {
    on<AddGameEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
