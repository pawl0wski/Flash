import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flash/utils/dependency_checker/dependency_checker.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  int currentIndex;

  MainBloc({this.currentIndex = 0}) : super(const MainStateUpdateIndex(0)) {
    on<MainEventChangeIndex>(_onChangeIndex);
    on<MainEventCheckDependencies>(_onCheckDependencies);
  }

  _onChangeIndex(MainEventChangeIndex event, Emitter<MainState> emitter) {
    currentIndex = event.newIndex;
    _emitUpdateIndexWithCurrentIndex(emitter);
  }

  _onCheckDependencies(
      MainEventCheckDependencies event, Emitter<MainState> emitter) {
    _checkDependenciesAndEmitDependenciesNotFoundIfNotExist(emitter);
  }

  _emitUpdateIndexWithCurrentIndex(Emitter<MainState> emitter) {
    emitter(MainStateUpdateIndex(currentIndex));
  }

  _checkDependenciesAndEmitDependenciesNotFoundIfNotExist(
      Emitter<MainState> emitter) {
    var dependencyChecker = DependencyChecker.withDefaultWhereisCommand();
    for (var command in [
      "ps",
      "pwdx",
      "xdotool",
      "xprop",
      "xrandr",
    ]) {
      if (!dependencyChecker.checkIfExists(command)) {
        emitter(MainStateDependencyNotExist(command));
      }
    }
  }
}
