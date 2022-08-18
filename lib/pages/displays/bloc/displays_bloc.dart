import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'displays_event.dart';
part 'displays_state.dart';

class DisplaysBloc extends Bloc<DisplaysEvent, DisplaysState> {
  DisplaysBloc() : super(DisplaysInitial()) {
    on<DisplaysEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
