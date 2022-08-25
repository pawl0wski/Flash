part of 'change_display_bloc.dart';

abstract class ChangeDisplayEvent extends Equatable {
  const ChangeDisplayEvent();
}

class ChangeDisplayEventLoadDisplays extends ChangeDisplayEvent {
  @override
  List<Object?> get props => [];
}

class ChangeDisplayEventChangeIndex extends ChangeDisplayEvent {
  final int newIndex;

  const ChangeDisplayEventChangeIndex(this.newIndex);

  @override
  List<Object?> get props => [newIndex];

}
