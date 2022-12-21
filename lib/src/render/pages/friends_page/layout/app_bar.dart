import 'package:friends_app/src/src.dart';

class FriendsPageAppBar extends StatelessWidget {
  const FriendsPageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueController<int> indexController =
        ValueController<int>(FriendsList.tabController.index);

    // we'll listen to the tabController & update the indexController accordingly
    FriendsList.tabController.addListener(() {
      indexController.update(FriendsList.tabController.index);
    });

    return ReactiveBuilder(
      controller: indexController,
      builder: (index) {
        return ReactiveBuilder(
          controller: X.themeMode,
          builder: (themeMode) {
            return AppBar(
              backgroundColor: themeMode == ThemeMode.dark ? darkC1 : lightC1,
              bottom: TabBar(
                controller: FriendsList.tabController,
                indicatorColor: primaryC,
                tabs: [
                  Tab(icon: usersIcon(color: index == 0 ? primaryC : black)),
                  Tab(icon: starOnIcon(color: index == 1 ? primaryC : black)),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
