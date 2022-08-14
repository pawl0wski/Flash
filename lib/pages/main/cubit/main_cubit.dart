import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState(index: 0, sidebarShowed: true));

  void setPage(int index) {
    _emitLastStateWith(newIndex: index + 1);
  }

  void toggleSidebar() {
    var lastShowSidebar = state.sidebarShowed;
    _emitLastStateWith(newSidebarShowed: !lastShowSidebar);
  }

  void _emitLastStateWith({int? newIndex, bool? newSidebarShowed}) {
    var copiedState =
        state.copy(newIndex: newIndex, newSidebarShowed: newSidebarShowed);
    emit(copiedState);
  }
}
