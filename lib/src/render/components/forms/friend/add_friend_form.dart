import 'package:friends_app/src/src.dart';

class AddFriendForm extends StatelessWidget {
  const AddFriendForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FriendProvider(
        friendModel: FriendModel.newModel(),
        child: MaterialForm(
          child: AdaptiveCard(
            width: 360,
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FriendFormFields(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CancelButton(),
                    SubmitButton(action: SubmitAction.add),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
