part of 'display_editor_bloc.dart';

abstract class DisplayEditorState extends Equatable {
  const DisplayEditorState();
}

class DisplayEditorStateShowDisplay extends DisplayEditorState {
  final Display display;

  const DisplayEditorStateShowDisplay({required this.display});

  @override
  List<Object> get props => [display];
}
