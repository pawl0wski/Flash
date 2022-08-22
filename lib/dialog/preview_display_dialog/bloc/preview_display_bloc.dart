import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'preview_display_event.dart';
part 'preview_display_state.dart';

class PreviewDisplayBloc
    extends Bloc<PreviewDisplayEvent, PreviewDisplayState> {
  int second = 10;

  PreviewDisplayBloc() : super(const PreviewDisplayStateSetSecond(10)) {
    on<PreviewDisplayEventStartTimer>(_onStartTimer);
    on<PreviewDisplayEventAccept>(_onAccept);
  }

  _onStartTimer(PreviewDisplayEventStartTimer event,
      Emitter<PreviewDisplayState> emitter) async {
    for (int i = 10; i > 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      emitter(PreviewDisplayStateSetSecond(--second));
    }
  }

  _onAccept(
      PreviewDisplayEventAccept event, Emitter<PreviewDisplayState> emitter) {}
}
