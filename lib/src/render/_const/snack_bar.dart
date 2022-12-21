import 'package:friends_app/src/src.dart';

bool get isDark => X.themeMode.value == ThemeMode.dark;

// functional snackBar widget
SnackBar snackBar(String msg) => SnackBar(
      content: Text(
        msg,
        style: const TextStyle(color: white),
      ),
      backgroundColor: black,
    );

final SnackBar avatarUpdatedSnackBar = snackBar('Avatar Updated');
final SnackBar invalidNameSnackBar = snackBar('Friend name cannot be empty');
final SnackBar addedFriendSnackBar = snackBar('Friend has been added');
final SnackBar removedFriendSnackBar = snackBar('Removed from friends');
final SnackBar addedToFavSnackBar = snackBar('Added to favorites');
final SnackBar removedFromFavSnackBar = snackBar('Removed from favorites');
