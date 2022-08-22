part of 'display_editor_bloc.dart';

abstract class DisplayEditorState {
  const DisplayEditorState();
}

class DisplayEditorStateShowDisplay extends DisplayEditorState {
  final Display display;

  const DisplayEditorStateShowDisplay(this.display);
}

class DisplayEditorStateCancel extends DisplayEditorState {
  const DisplayEditorStateCancel();
}

class DisplayEditorStatePreviewDisplay extends DisplayEditorState {
  final Display display;

  const DisplayEditorStatePreviewDisplay(this.display) : super();
}
