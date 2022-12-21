import 'package:friends_app/src/src.dart';

abstract class Api {
  static Future<List<FriendModel>> loadFriends() async {
    String fullName() =>
        '${faker.person.firstName()} ${faker.person.lastName()}';
    String phoneNumber() =>
        '+1-${XUtils.genNum(length: 3)}-${XUtils.genNum(length: 3)}-${XUtils.genNum(length: 4)}';

    Map<String, String?> genFriendMap() => {
          'id': XUtils.genId(),
          'name': fullName(),
          'mobile': phoneNumber(),
          'avatar': null,
        };

    List<FriendModel> genFriendsList() => List<FriendModel>.generate(
          5,
          (int count) => FriendModel.fromMap(genFriendMap()),
        );

    return Future.delayed(const Duration(seconds: 2), genFriendsList);
  }
}
