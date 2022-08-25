part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainStateUpdateIndex extends MainState {
  final int index;

  const MainStateUpdateIndex(this.index);

  @override
  List<Object> get props => [index];
}

class MainStateDependencyNotExist extends MainState {
  final String dependency;

  const MainStateDependencyNotExist(this.dependency);

  @override
  List<Object?> get props => [dependency];
}
