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
  }

  _onLoad(DisplaysEventLoad event, Emitter<DisplaysState> emitter) {
    _getDisplaysFromRepository();
    emitter(DisplaysStateLoaded(displays: _displays));
  }

  _getDisplaysFromRepository() {
    _displays = _displayRepository.getAll();
  }
}
