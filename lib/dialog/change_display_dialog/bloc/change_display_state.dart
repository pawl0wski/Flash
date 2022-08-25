part of 'change_display_bloc.dart';

abstract class ChangeDisplayState extends Equatable {
  const ChangeDisplayState();
}

class ChangeDisplayStateShowDisplays extends ChangeDisplayState {
  final int currentIndex;
  final List<Display> displays;

  int get currentIndexIncludingNone => currentIndex + 1;

  List<String> get displaysName =>
      displays.map((Display display) => display.name).toList();

  List<String> get displaysNameWithNone => ["---", ...displaysName];

  const ChangeDisplayStateShowDisplays(
      {required this.currentIndex, required this.displays});

  @override
  List<Object> get props => [currentIndex, displays];
}

class ChangeDisplayStateClose extends ChangeDisplayState {
  @override
  List<Object?> get props => [];
}
