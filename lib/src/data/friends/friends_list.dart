import 'package:friends_app/src/src.dart';

class FriendsList extends StatefulData {
  // instead of global reference
  // I prefer singleton class, it's a matter of taste

  // create a private constructor method
  FriendsList._constructor();

  // assign the instantiated object to a static final private property
  static final FriendsList _this = FriendsList._constructor();

  // create a public getter that returns the same final object everytime
  static FriendsList get instance => _this;

  final List<FriendModel> all = [];
  final List<FriendModel> favs = [];

  static late TabController tabController;

  final ValueController<bool> loading = ValueController<bool>(false);
  final ValueController<bool> hasMore = ValueController<bool>(true);

  /// to load data
  void load() async {
    // set loading true to prevent pagination from firing while loading
    loading.update(true);
    final List<FriendModel> list = await Api.loadFriends();
    all.addAll(list);
    // hasMore logic
    // otherwise, it will paginate infinitely
    hasMore.update(all.length < 15);
    // to allow pagination again
    loading.update(false);
    update();
  }

  // used with pull to refresh
  Future<void> refresh() async {
    // clear all data
    all.clear();
    favs.clear();
    update();
    // reset hasMore
    hasMore.update(true);
    // load data again
    load();
  }

  /// invoke when a [FriendModel] triggers favorite property
  void updateFavs() async {
    favs.clear();
    List<FriendModel> list = await Future.value(
      all.where((friend) => friend.favorite).toList(),
    );
    favs.addAll(list);
    update();
  }

  FriendModel getById(String id) =>
      all.singleWhere((friend) => friend.id == id);

  /// adding a new [FriendModel]
  void addFriend(FriendModel model) {
    if (model.name.isNotEmpty) {
      all.add(model);
      update();
      X.showSnackBar(snackBar: addedFriendSnackBar);
      X.pop();
    } else {
      X.showSnackBar(snackBar: invalidNameSnackBar);
    }
  }

  /// deleting a [FriendModel]
  void deleteFriend(FriendModel model) {
    all.remove(model);
    favs.remove(model);
    update();
    X.showSnackBar(snackBar: removedFriendSnackBar);
    X.pop();
  }
}
