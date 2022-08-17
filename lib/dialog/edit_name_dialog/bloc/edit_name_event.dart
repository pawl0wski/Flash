part of 'edit_name_bloc.dart';

@immutable
abstract class EditNameEvent extends Equatable {
  const EditNameEvent();
}

class EditNameEventChangeName extends EditNameEvent {
  final String name;

  const EditNameEventChangeName(this.name);

  @override
  List<Object?> get props => [name];
}

class EditNameEventSave extends EditNameEvent {
  const EditNameEventSave();

  @override
  List<Object?> get props => [];
}
