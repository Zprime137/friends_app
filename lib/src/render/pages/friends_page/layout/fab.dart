import 'package:friends_app/src/src.dart';

class AddFriendButton extends StatelessWidget {
  const AddFriendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      height: 70,
      width: 70,
      borderRadius: rounded,
      lightModeC: white,
      darkModeC: black,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () => X.showModal(widget: const AddFriendForm()),
        icon: plusIcon(color: primaryC),
      ),
    );
  }
}
