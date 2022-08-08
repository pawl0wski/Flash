import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(index: 0));

  void setPage(int index) {
    emit(MainState(
        index: index + 1)); // WelcomePage is first so we must increment
  }
}
