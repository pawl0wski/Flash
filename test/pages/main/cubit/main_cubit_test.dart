import 'package:bloc_test/bloc_test.dart';
import 'package:flash/pages/main/cubit/main_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("MainBloc", () {
    blocTest(
      "should set new incremented index",
      build: () => MainCubit(),
      act: (MainCubit cubit) => cubit.setPage(1),
      expect: () => [const MainState(index: 2)],
    );
  });
}
