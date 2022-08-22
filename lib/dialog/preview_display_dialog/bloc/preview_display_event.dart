part of 'preview_display_bloc.dart';

@immutable
abstract class PreviewDisplayEvent {
  const PreviewDisplayEvent();
}

class PreviewDisplayEventStartTimer extends PreviewDisplayEvent {
  const PreviewDisplayEventStartTimer() : super();
}

class PreviewDisplayEventAccept extends PreviewDisplayEvent {
  const PreviewDisplayEventAccept();
}

class PreviewDisplayEventClose extends PreviewDisplayEvent {
  const PreviewDisplayEventClose();
}
