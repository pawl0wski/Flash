part of 'preview_display_bloc.dart';

@immutable
abstract class PreviewDisplayEvent {
  const PreviewDisplayEvent();
}

class PreviewDisplayEventStartTimer extends PreviewDisplayEvent {
  const PreviewDisplayEventStartTimer() : super();
}
