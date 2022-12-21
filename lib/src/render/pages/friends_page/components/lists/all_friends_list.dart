import 'package:friends_app/src/src.dart';

class AllFriendsList extends StatelessWidget {
  const AllFriendsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FriendsList.instance;

    // Pull to refresh
    return RefreshIndicator(
      color: primaryC,
      onRefresh: controller.refresh,
      // rebuilder for the StatefulData
      child: ReBuilder(
        controller: controller,
        builder: () {
          // create the widgets list
          final List<Widget> cards = List<Widget>.generate(
            controller.all.length,
            (int index) => FriendProvider(
              friendModel: controller.all[index],
              child: const FriendCard(),
            ),
          );

          // reactive builder for the state of hasMore
          return ReactiveBuilder(
            controller: controller.hasMore,
            builder: (hasMore) {
              // self-invoking function
              // runs on rebuild
              () {
                const noMoreKey = Key('NoMore');
                !hasMore
                    ? cards.add(const NoMoreCard(key: noMoreKey))
                    : cards.removeWhere((widget) => widget.key == noMoreKey);
              }();

              // reactive builder for the state of loading
              return ReactiveBuilder(
                controller: controller.loading,
                builder: (loading) {
                  () {
                    const loaderKey = Key('Loader');
                    loading
                        ? cards.add(const LoaderCard(key: loaderKey))
                        : cards
                            .removeWhere((widget) => widget.key == loaderKey);
                  }();

                  final ScrollController scrollController = ScrollController();
                  bool paginate(UserScrollNotification notification) {
                    if (hasMore &&
                        !loading &&
                        notification.direction == ScrollDirection.reverse &&
                        scrollController.position.extentAfter <= 360) {
                      controller.load();
                    }
                    return true;
                  }

                  // scroll listener for pagination
                  return NotificationListener<UserScrollNotification>(
                    onNotification: paginate,
                    child: PersistStateWidget(
                      child: ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount: cards.length,
                        itemBuilder: (_, index) => cards[index],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
