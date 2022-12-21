// ignore_for_file: constant_identifier_names
import 'package:friends_app/src/src.dart';

const String FriendPath = '/friend/:id';

// functional path string
String friendPath(String id) => '/friend/$id';

final RouteMap routeMap = RouteMap(
  routes: {
    Root: (RouteData info) => const MaterialPage(child: FriendsPage()),
    FriendPath: (RouteData info) =>
        MaterialPage(child: FriendPage(id: info.pathParameters['id']!)),
  },
  // onUnknownRoute:
);
