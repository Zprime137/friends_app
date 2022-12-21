import 'package:friends_app/src/src.dart';

class DeleteFriendForm extends StatelessWidget {
  const DeleteFriendForm({super.key});

  @override
  Widget build(BuildContext context) {
    final FriendModel friendModel = FriendProvider.of(context).friendModel;

    return MaterialForm(
      child: AdaptiveCard(
        width: 360,
        height: 220,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100,
              child: Center(
                child: AdaptiveText(
                  'You are about to Delete ${friendModel.name}',
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CancelButton(),
                  SubmitButton(action: SubmitAction.delete),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
