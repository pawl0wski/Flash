part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainEventChangeIndex extends MainEvent {
  final int newIndex;

  const MainEventChangeIndex(this.newIndex);

  @override
  List<Object?> get props => [newIndex];
}

class MainEventCheckDependencies extends MainEvent {
  const MainEventCheckDependencies();

  @override
  List<Object?> get props => [];
}
