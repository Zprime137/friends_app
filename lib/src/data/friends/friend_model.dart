import 'package:friends_app/src/src.dart';

// if the data will be shared between widgets make a provider
class FriendProvider extends DataProvider<FriendModel> {
  final FriendModel friendModel;

  const FriendProvider({
    super.key,
    required this.friendModel,
    required super.child,
  }) : super(data: friendModel);

  static FriendProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FriendProvider>()!;
}

class FriendModel extends StatefulData {
  final String id;
  String name;
  String mobile;
  String? avatar;
  bool favorite;

  FriendModel({
    required this.id,
    required this.name,
    required this.mobile,
    this.avatar,
    this.favorite = false,
  });

  late final TextEditingController nameController =
      TextEditingController(text: name);
  late final TextEditingController mobileController =
      TextEditingController(text: mobile);

  factory FriendModel.fromMap(Map<String, dynamic> map) {
    return FriendModel(
      id: map['id'] as String,
      name: map['name'] as String,
      mobile: map['mobile'] as String,
      avatar: map['avatar'],
      favorite: map['favorite'] ?? false,
    );
  }

  static FriendModel newModel() => FriendModel(
        id: XUtils.genId(),
        name: '',
        mobile: '',
      );

  void toggleFavorite() {
    X.showSnackBar(
        snackBar: favorite ? removedFromFavSnackBar : addedToFavSnackBar);
    favorite = !favorite;
    update();
    FriendsList.instance.updateFavs();
  }

  void updateName() async {
    // ToDo: add validation
    name = nameController.text;
    update();
  }

  void updateMobile() {
    // ToDo: add validation
    mobile = mobileController.text;
    update();
  }

  void updateAvatar() {
    // ToDo: call ImagePicker service class
    avatar = alien;
    update();
    X.showSnackBar(
      snackBar: avatarUpdatedSnackBar,
    );
  }
}
