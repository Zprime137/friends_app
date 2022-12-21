import 'package:friends_app/src/src.dart';

class EditFriendForm extends StatelessWidget {
  const EditFriendForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialForm(
      child: AdaptiveCard(
        width: 360,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ToggleFavButton(),
                  DeleteFriendButton(),
                ],
              ),
            ),
            const FriendFormFields(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
