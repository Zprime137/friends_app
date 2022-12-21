import 'package:friends_app/src/src.dart';

class FavoriteFriendsList extends StatelessWidget {
  const FavoriteFriendsList({super.key});

  @override
  Widget build(BuildContext context) {
    final FriendsList controller = FriendsList.instance;

    return ReBuilder(
      controller: controller,
      builder: () {
        final List<Widget> friendsCards = List<Widget>.generate(
          controller.favs.length,
          (int index) => FriendProvider(
            friendModel: controller.favs[index],
            child: const FriendCard(),
          ),
        );

        return PersistStateWidget(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 20),
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: friendsCards.length,
            itemBuilder: (_, index) => friendsCards[index],
          ),
        );
      },
    );
  }
}
