import 'package:friends_app/src/src.dart';

class NoMoreCard extends StatelessWidget {
  const NoMoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AdaptiveCard(
        height: 100,
        width: 360,
        child: Center(
          child: AdaptiveText("That's it :)"),
        ),
      ),
    );
  }
}
