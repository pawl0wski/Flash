part of 'preview_display_bloc.dart';

@immutable
abstract class PreviewDisplayEvent {
  const PreviewDisplayEvent();
}

class PreviewDisplayEventDecrementSecond extends PreviewDisplayEvent {
  const PreviewDisplayEventDecrementSecond() : super();
}
