part of 'change_display_bloc.dart';

abstract class ChangeDisplayState extends Equatable {
  const ChangeDisplayState();
}

class ChangeDisplayStateShowDisplays extends ChangeDisplayState {
  final int currentIndex;
  final List<Display> displays;

  const ChangeDisplayStateShowDisplays(
      {required this.currentIndex, required this.displays});

  @override
  List<Object> get props => [];
}
