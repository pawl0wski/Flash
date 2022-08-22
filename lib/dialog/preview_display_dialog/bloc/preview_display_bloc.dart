import 'package:bloc/bloc.dart';
import 'package:flash/utils/repository/display_repository.dart';
import 'package:flash/utils/repository/models/display.dart';
import 'package:meta/meta.dart';

part 'preview_display_event.dart';
part 'preview_display_state.dart';

class PreviewDisplayBloc
    extends Bloc<PreviewDisplayEvent, PreviewDisplayState> {
  final DisplayRepository _displayRepository;
  final Display _display;
  int second = 10;

  PreviewDisplayBloc(Display display, {DisplayRepository? displayRepository})
      : _display = display,
        _displayRepository = displayRepository ?? DisplayRepository(),
        super(const PreviewDisplayStateSetSecond(10)) {
    on<PreviewDisplayEventStartTimer>(_onStartTimer);
    on<PreviewDisplayEventAccept>(_onAccept);
    on<PreviewDisplayEventClose>(_onClose);
  }

  _onStartTimer(PreviewDisplayEventStartTimer event,
      Emitter<PreviewDisplayState> emitter) async {
    for (int i = 10; i > 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      emitter(PreviewDisplayStateSetSecond(--second));
    }
  }

  _onAccept(
      PreviewDisplayEventAccept event, Emitter<PreviewDisplayState> emitter) {
    _displayRepository.addOrUpdate(_display);
    emitter(const PreviewDisplayStateClose());
  }

  _onClose(
      PreviewDisplayEventClose event, Emitter<PreviewDisplayState> emitter) {
    emitter(const PreviewDisplayStateBackToEdit());
  }
}
