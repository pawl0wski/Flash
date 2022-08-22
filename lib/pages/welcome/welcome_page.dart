import 'package:flash/pages/welcome/widgets/welcome_title_widget.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: WelcomeTitleWidget(),
    );
  }
}
