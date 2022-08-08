import 'package:bloc/bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(index: 1));

  void setPage(int index) {
    emit(MainState(index: index));
  }
}
