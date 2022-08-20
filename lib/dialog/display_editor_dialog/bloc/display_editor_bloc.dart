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
    on<DisplayEditorEventChangeName>(_onChangeName);
    on<DisplayEditorEventChangeBrightness>(_onChangeBrightness);
    on<DisplayEditorEventChangeRGB>(_onChangeRGB);
    on<DisplayEditorEventChangeGamma>(_onChangeGamma);
  }

  _onChangeName(
      DisplayEditorEventChangeName event, Emitter<DisplayEditorState> emitter) {
    _display.name = event.newName;
    _emitChangeDisplay(emitter);
  }

  _onChangeBrightness(DisplayEditorEventChangeBrightness event,
      Emitter<DisplayEditorState> emitter) {
    _display.brightness = event.newBrightness;
    _emitChangeDisplay(emitter);
  }

  _onChangeRGB(
      DisplayEditorEventChangeRGB event, Emitter<DisplayEditorState> emitter) {
    _display.rgb = event.newRGB;
    _emitChangeDisplay(emitter);
  }

  _onChangeGamma(DisplayEditorEventChangeGamma event,
      Emitter<DisplayEditorState> emitter) {
    _display.rgb = RGB.fromGamma(event.gamma);
    _emitChangeDisplay(emitter);
  }

  _emitChangeDisplay(Emitter<DisplayEditorState> emitter) {
    emitter(DisplayEditorStateShowDisplay(display: _display));
  }
}
