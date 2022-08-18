import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/displays_bloc.dart';

class DisplaysPage extends StatelessWidget {
  const DisplaysPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _initializeBloc(child: Container());
  }

  Widget _initializeBloc({required Widget child}) {
    return BlocProvider(
      create: (BuildContext context) => DisplaysBloc(),
      child: child,
    );
  }
}
