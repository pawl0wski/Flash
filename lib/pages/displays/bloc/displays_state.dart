part of 'displays_bloc.dart';

abstract class DisplaysState extends Equatable {
  const DisplaysState();
}

class DisplaysStateLoading extends DisplaysState {
  @override
  List<Object> get props => [];
}

class DisplaysStateLoaded extends DisplaysState {
  final List<Display> displays;

  const DisplaysStateLoaded({required this.displays});

  @override
  List<Object> get props => [];
}
