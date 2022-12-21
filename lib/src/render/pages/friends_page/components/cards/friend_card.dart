import 'package:friends_app/src/src.dart';

class FriendCard extends StatelessWidget {
  const FriendCard({super.key});

  @override
  Widget build(BuildContext context) {
    final FriendModel friendModel = FriendProvider.of(context).friendModel;

    return Center(
      child: GestureDetector(
        onTap: () => X.to(path: friendPath(friendModel.id)),
        child: AdaptiveCard(
          height: 200,
          width: 360,
          child: Row(
            children: [
              SizedBox(
                width: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    ToggleFavButton(),
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: FriendAvatar(),
                    ),
                    DeleteFriendButton(),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FriendName(),
                    LineWidget(),
                    FriendNumber(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FriendAvatar extends StatelessWidget {
  final double size;
  const FriendAvatar({super.key, this.size = 80});

  @override
  Widget build(BuildContext context) {
    final FriendModel friendModel = FriendProvider.of(context).friendModel;

    return Container(
      height: size,
      width: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: black,
        borderRadius: rounded,
      ),
      child: ReBuilder(
        controller: friendModel,
        builder: () {
          return friendModel.avatar != null
              ? ImageWidget(
                  path: friendModel.avatar!,
                  svgColor: primaryC,
                )
              : personIcon(size: 40, color: white);
        },
      ),
    );
  }
}

class FriendName extends StatelessWidget {
  const FriendName({super.key});

  @override
  Widget build(BuildContext context) {
    final FriendModel friendModel = FriendProvider.of(context).friendModel;

    return Container(
      padding: const EdgeInsets.all(20),
      child: ReBuilder(
        controller: friendModel,
        builder: () {
          return Text(
            friendModel.name,
            style: const TextStyle(color: primaryC),
          );
        },
      ),
    );
  }
}

class FriendNumber extends StatelessWidget {
  const FriendNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final FriendModel friendModel = FriendProvider.of(context).friendModel;

    return Container(
      padding: const EdgeInsets.all(20),
      child: ReBuilder(
        controller: friendModel,
        builder: () {
          return AdaptiveText(friendModel.mobile);
        },
      ),
    );
  }
}
