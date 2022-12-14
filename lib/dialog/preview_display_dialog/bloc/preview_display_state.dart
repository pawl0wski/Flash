part of 'preview_display_bloc.dart';

@immutable
abstract class PreviewDisplayState {
  const PreviewDisplayState();
}

class PreviewDisplayStateSetSecond extends PreviewDisplayState {
  final int second;

  const PreviewDisplayStateSetSecond(this.second) : super();
}

class PreviewDisplayStateClose extends PreviewDisplayState {
  const PreviewDisplayStateClose();
}

class PreviewDisplayStateBackToEdit extends PreviewDisplayState {
  const PreviewDisplayStateBackToEdit();
}
