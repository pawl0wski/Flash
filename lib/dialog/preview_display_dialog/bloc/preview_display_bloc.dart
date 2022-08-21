import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'preview_display_event.dart';
part 'preview_display_state.dart';

class PreviewDisplayBloc
    extends Bloc<PreviewDisplayEvent, PreviewDisplayState> {
  PreviewDisplayBloc() : super(const PreviewDisplayStateSetSecond(10)) {
    on<PreviewDisplayEvent>((event, emit) {});
  }
}
