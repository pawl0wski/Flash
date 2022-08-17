part of 'edit_name_bloc.dart';

@immutable
abstract class EditNameState extends Equatable {}

class EditNameStateInitial extends EditNameState {
  final String name;

  EditNameStateInitial({required this.name});

  @override
  List<Object?> get props => [];
}

class EditNameStateClose extends EditNameState {
  @override
  List<Object?> get props => [];
}
