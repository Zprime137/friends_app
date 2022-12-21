import 'package:friends_app/src/src.dart';

class FriendPageAppBar extends StatelessWidget {
  const FriendPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveBuilder(
      controller: X.themeMode,
      builder: (themeMode) {
        return AppBar(
          backgroundColor: themeMode == ThemeMode.dark ? darkC : lightC,
          automaticallyImplyLeading: true, // for the handicapped ios
          leading: const BackButton(color: primaryC),
        );
      },
    );
  }
}
