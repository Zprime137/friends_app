import 'package:friends_app/src/src.dart';

import 'layout/app_bar.dart';

class FriendPage extends StatelessWidget {
  final String id;
  const FriendPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FriendModel friendModel = FriendsList.instance.getById(id);

    return ScaffoldX(
      appBar: const FriendPageAppBar(),
      scrollView: true,
      body: FriendProvider(
        friendModel: friendModel,
        child: const EditFriendForm(),
      ),
    );
  }
}
