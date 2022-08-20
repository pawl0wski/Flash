part of 'display_editor_bloc.dart';

abstract class DisplayEditorEvent extends Equatable {
  const DisplayEditorEvent();
}

class DisplayEditorEventChangeName extends DisplayEditorEvent {
  final String newName;

  const DisplayEditorEventChangeName(this.newName);

  @override
  List<Object?> get props => [newName];
}

class DisplayEditorEventChangeRGB extends DisplayEditorEvent {
  final RGB newRGB;

  const DisplayEditorEventChangeRGB(this.newRGB);

  @override
  List<Object?> get props => [newRGB];
}

class DisplayEditorEventChangeGamma extends DisplayEditorEvent {
  final double gamma;

  const DisplayEditorEventChangeGamma(this.gamma);

  @override
  List<Object?> get props => [gamma];
}

class DisplayEditorEventChangeBrightness extends DisplayEditorEvent {
  final double newBrightness;

  const DisplayEditorEventChangeBrightness({required this.newBrightness});

  @override
  List<Object?> get props => [newBrightness];
}
