import 'package:friends_app/src/src.dart';

class LoaderCard extends StatelessWidget {
  const LoaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: rounded,
      color: X.themeMode.value == ThemeMode.dark ? black : white,
    );

    final Widget line = Container(
      height: 20,
      width: 160,
      decoration: boxDecoration,
    );
    final Widget circle = Container(
      height: 80,
      width: 80,
      decoration: boxDecoration,
    );

    final AdaptiveCard adaptiveCard = AdaptiveCard(
      height: 200,
      width: 360,
      child: Shimmer.fromColors(
        baseColor: X.themeMode.value == ThemeMode.dark ? black : white,
        highlightColor: primaryC,
        child: Row(
          children: [
            SizedBox(
              width: 80,
              child: circle,
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  line,
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: LineWidget(),
                  ),
                  line,
                ],
              ),
            )
          ],
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        adaptiveCard,
        const SizedBox(height: 10),
        adaptiveCard,
        const SizedBox(height: 10),
        adaptiveCard,
      ],
    );
  }
}
