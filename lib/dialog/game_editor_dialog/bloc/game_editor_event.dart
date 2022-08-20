part of 'game_editor_bloc.dart';

@immutable
abstract class GameEditorEvent extends Equatable {
  const GameEditorEvent();
}

class GameEditorEventChangeName extends GameEditorEvent {
  final String name;

  const GameEditorEventChangeName(this.name);

  @override
  List<Object?> get props => [name];
}

class GameEditorEventSave extends GameEditorEvent {
  const GameEditorEventSave();

  @override
  List<Object?> get props => [];
}
