part of 'game_editor_bloc.dart';

@immutable
abstract class GameEditorState extends Equatable {}

class GameEditorStateInitial extends GameEditorState {
  final String name;

  GameEditorStateInitial({required this.name});

  @override
  List<Object?> get props => [];
}

class GameEditorStateClose extends GameEditorState {
  @override
  List<Object?> get props => [];
}
