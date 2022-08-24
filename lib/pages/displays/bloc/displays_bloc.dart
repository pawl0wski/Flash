import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/repository/display_repository.dart';
import 'package:flash/utils/repository/models/display.dart';

part 'displays_event.dart';
part 'displays_state.dart';

class DisplaysBloc extends Bloc<DisplaysEvent, DisplaysState> {
  final DisplayRepository _displayRepository;
  List<Display> _displays = [];

  DisplaysBloc({DisplayRepository? displayRepository})
      : _displayRepository = displayRepository ?? DisplayRepository(),
        super(DisplaysStateLoading()) {
    on<DisplaysEventLoad>(_onLoad);
    on<DisplaysEventCreateNewDisplay>(_onCreateNewDisplay);
    on<DisplaysEventEditDisplay>(_onEditDisplay);
    on<DisplaysEventDeleteDisplay>(_onDeleteDisplay);
  }

  _onLoad(DisplaysEventLoad event, Emitter<DisplaysState> emitter) {
    _refreshDisplaysAndEmitLoaded(emitter: emitter);
  }

  _onCreateNewDisplay(
      DisplaysEventCreateNewDisplay event, Emitter<DisplaysState> emitter) {
    var newBlankDisplay = Display.createBlank();
    emitter(DisplaysStateEditDisplay(displayToEdit: newBlankDisplay));
  }

  _onEditDisplay(
      DisplaysEventEditDisplay event, Emitter<DisplaysState> emitter) {
    emitter(DisplaysStateEditDisplay(displayToEdit: event.displayToEdit));
  }

  _onDeleteDisplay(
      DisplaysEventDeleteDisplay event, Emitter<DisplaysState> emitter) {
    var displayToDelete = event.displayToDelete;
    _displayRepository.delete(displayToDelete.uuid);
    _refreshDisplaysAndEmitLoaded(emitter: emitter);
  }

  _getDisplaysFromRepository() {
    _displays = _displayRepository.getAll();
  }

  _refreshDisplaysAndEmitLoaded({required Emitter<DisplaysState> emitter}) {
    _getDisplaysFromRepository();
    emitter(DisplaysStateLoaded(displays: _displays));
  }
}
