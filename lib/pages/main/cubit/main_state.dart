part of 'main_cubit.dart';

class MainState extends Equatable {
  final int index;
  final bool sidebarShowed;

  const MainState({required this.index, required this.sidebarShowed});

  MainState copy({int? newIndex, bool? newSidebarShowed}) {
    return MainState(
        index: newIndex ?? index,
        sidebarShowed: newSidebarShowed ?? sidebarShowed);
  }

  @override
  List<Object> get props => [index, sidebarShowed];
}
