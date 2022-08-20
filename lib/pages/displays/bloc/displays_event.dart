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
