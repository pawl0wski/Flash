part of 'display_editor_bloc.dart';

abstract class DisplayEditorState {
  const DisplayEditorState();
}

class DisplayEditorStateShowDisplay extends DisplayEditorState {
  final Display display;

  const DisplayEditorStateShowDisplay({required this.display});
}

class DisplayEditorStatePreviewDisplay extends DisplayEditorState {
  final Display display;

  const DisplayEditorStatePreviewDisplay(this.display) : super();
}
