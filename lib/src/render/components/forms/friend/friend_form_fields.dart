import 'package:friends_app/src/src.dart';

class FriendFormFields extends StatelessWidget {
  const FriendFormFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AvatarField(),
        SizedBox(height: 20),
        FriendNameField(),
        SizedBox(height: 20),
        FriendNumberField(),
        SizedBox(height: 20),
      ],
    );
  }
}

class AvatarField extends StatelessWidget {
  const AvatarField({super.key});

  @override
  Widget build(BuildContext context) {
    final FriendModel friendModel = FriendProvider.of(context).friendModel;

    return SizedBox(
      height: 200,
      width: 180,
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: FriendAvatar(size: 180),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: friendModel.updateAvatar,
              icon: Container(
                height: 36,
                width: 36,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: primaryC,
                  borderRadius: rounded,
                ),
                child: editIcon(size: 20, color: white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FriendNameField extends StatelessWidget {
  const FriendNameField({super.key});

  @override
  Widget build(BuildContext context) {
    final FriendModel friendModel = FriendProvider.of(context).friendModel;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: friendModel.nameController,
        onChanged: (String text) => friendModel.updateName(),
        textAlign: TextAlign.center,
        cursorColor: primaryC,
        keyboardType: TextInputType.name,
        style: const TextStyle(fontSize: 16, color: primaryC),
        decoration: InputDecoration(
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          errorBorder: errorBorder,
          hintText: "Enter Name",
        ),
      ),
    );
  }
}

class FriendNumberField extends StatelessWidget {
  const FriendNumberField({super.key});

  @override
  Widget build(BuildContext context) {
    final FriendModel friendModel = FriendProvider.of(context).friendModel;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: friendModel.mobileController,
        onChanged: (String text) => friendModel.updateMobile(),
        textAlign: TextAlign.center,
        cursorColor: primaryC,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          errorBorder: errorBorder,
          hintText: "Enter Mobile Number",
        ),
      ),
    );
  }
}

class DefaultButtonStyle extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  const DefaultButtonStyle(
      {super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AdaptiveCard(
      height: 50,
      width: 120,
      lightModeC: white,
      darkModeC: black,
      borderRadius: rounded,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: child,
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final SubmitAction action;
  const SubmitButton({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    final FriendsList friendsController = FriendsList.instance;
    final FriendModel friendModel = FriendProvider.of(context).friendModel;

    return DefaultButtonStyle(
      onPressed: () {
        action == SubmitAction.add
            ? friendsController.addFriend(friendModel)
            : friendsController.deleteFriend(friendModel);
      },
      child: checkIcon(color: primaryC),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultButtonStyle(
      onPressed: () => X.pop(),
      child: closeIcon(color: red),
    );
  }
}

class ToggleFavButton extends StatelessWidget {
  const ToggleFavButton({super.key});

  @override
  Widget build(BuildContext context) {
    final FriendModel friendModel = FriendProvider.of(context).friendModel;

    return ReBuilder(
      controller: friendModel,
      builder: () {
        return IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => friendModel.toggleFavorite(),
          icon: friendModel.favorite
              ? starOnIcon(color: primaryC)
              : starOffIcon(),
        );
      },
    );
  }
}

class DeleteFriendButton extends StatelessWidget {
  const DeleteFriendButton({super.key});

  @override
  Widget build(BuildContext context) {
    final FriendModel friendModel = FriendProvider.of(context).friendModel;

    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () => X.showModal(
        widget: FriendProvider(
          friendModel: friendModel,
          child: const DeleteFriendForm(),
        ),
      ),
      icon: minusIcon(),
    );
  }
}
