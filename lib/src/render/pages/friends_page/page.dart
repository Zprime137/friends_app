import 'package:friends_app/src/src.dart';

import 'layout/app_bar.dart';
import 'layout/fab.dart';

export 'components/cards/friend_card.dart';
export 'components/cards/loader_card.dart';
export 'components/cards/no_more_card.dart';
export 'components/lists/all_friends_list.dart';
export 'components/lists/fav_friends_list.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    FriendsList.tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldX(
      appBar: const FriendsPageAppBar(),
      fab: const AddFriendButton(),
      body: TabBarView(
        controller: FriendsList.tabController,
        children: const [
          AllFriendsList(),
          FavoriteFriendsList(),
        ],
      ),
    );
  }
}
