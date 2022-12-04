part of '../pages/user_chats_page.dart';

class _ChatsListWidget extends HookWidget {
  const _ChatsListWidget();

  // bool _isBottom(ScrollController scrollC) {
  //   if (!scrollC.hasClients) return false;
  //   final maxScroll = scrollC.position.maxScrollExtent;
  //   final currentScroll = scrollC.offset;
  //   return currentScroll >= (maxScroll * 0.9);
  // }

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          context.read<UserChatsBloc>().add(UserChatsPaginationEvent());
        }
      });
      return;
    }, [scrollController]);
    return BlocBuilder<UserChatsBloc, UserChatsState>(
      builder: (context, state) {
        return ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            if (state.chats.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return index >= state.chats.length
                ? const CupertinoActivityIndicator()
                : AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: _ChatItem(
                          onTap: () {
                            context.read<UserMessagesBloc>().add(
                                  GetUserMessagesEvent(
                                      state.chats[index].receiverId),
                                );
                            context.push(
                              ChatRoomPage(
                                receiverId: state.chats[index].receiverId,
                              ),
                            );
                          },
                          userChat: state.chats[index],
                        ),
                      ),
                    ),
                  );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount:
              state.hasReachedMax ? state.chats.length : state.chats.length + 1,
          // itemCount: 6,
        );
      },
    );
  }
}
