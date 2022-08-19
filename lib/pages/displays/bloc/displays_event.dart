part of 'displays_bloc.dart';

abstract class DisplaysEvent extends Equatable {
  const DisplaysEvent();
}

class DisplaysEventLoad extends DisplaysEvent {
  const DisplaysEventLoad();

  @override
  List<Object?> get props => [];
}
