part of 'displays_bloc.dart';

abstract class DisplaysEvent extends Equatable {
  const DisplaysEvent();
}

class DisplaysEventLoad extends DisplaysEvent {
  const DisplaysEventLoad();

  @override
  List<Object?> get props => [];
}

class DisplaysEventCreateNewDisplay extends DisplaysEvent {
  const DisplaysEventCreateNewDisplay();

  @override
  List<Object?> get props => [];
}

class DisplaysEventEditDisplay extends DisplaysEvent {
  final Display displayToEdit;

  const DisplaysEventEditDisplay(this.displayToEdit);

  @override
  List<Object?> get props => [displayToEdit];
}

class DisplaysEventDeleteDisplay extends DisplaysEvent {
  final Display displayToDelete;

  const DisplaysEventDeleteDisplay(this.displayToDelete);

  @override
  List<Object?> get props => [displayToDelete];
}
