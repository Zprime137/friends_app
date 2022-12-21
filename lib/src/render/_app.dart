import 'package:friends_app/src/src.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // when app initialized
    FriendsList.instance.load();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialX(
      materialApp: materialApp,
      routeMap: routeMap,
    );
  }
}
