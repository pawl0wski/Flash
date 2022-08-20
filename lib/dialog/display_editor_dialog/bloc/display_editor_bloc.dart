import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/repository/display_repository.dart';
import 'package:flash/utils/repository/models/display.dart';

part 'display_editor_event.dart';

part 'display_editor_state.dart';

class DisplayEditorBloc extends Bloc<DisplayEditorEvent, DisplayEditorState> {
  final Display _display;
  final DisplayRepository _displayRepository;

  DisplayEditorBloc(
      {required Display display, DisplayRepository? displayRepository})
      : _display = display,
        _displayRepository = displayRepository ?? DisplayRepository(),
        super(DisplayEditorStateShowDisplay(display: display)) {
    on<DisplayEditorEvent>((event, emit) {});
  }
}
