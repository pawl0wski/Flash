part of 'display_editor_bloc.dart';

abstract class DisplayEditorEvent extends Equatable {
  const DisplayEditorEvent();
}

class DisplayEditorEventChangeName extends DisplayEditorEvent {
  final String newName;

  const DisplayEditorEventChangeName({required this.newName});

  @override
  List<Object?> get props => [newName];
}

class DisplayEditorEventChangeRGB extends DisplayEditorEvent {
  final RGB newRGB;

  const DisplayEditorEventChangeRGB({required this.newRGB});

  @override
  List<Object?> get props => [newRGB];
}

class DisplayEditorEventChangeBrightness extends DisplayEditorEvent {
  final double newBrightness;

  const DisplayEditorEventChangeBrightness({required this.newBrightness});

  @override
  List<Object?> get props => [newBrightness];
}