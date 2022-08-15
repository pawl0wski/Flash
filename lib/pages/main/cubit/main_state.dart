part of 'main_cubit.dart';

class MainState extends Equatable {
  final int index;

  const MainState({required this.index});

  @override
  List<Object> get props => [index];
}
