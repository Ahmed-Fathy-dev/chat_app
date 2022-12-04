part of '../pages/chat_room.dart';

class _ChatMsgsSection extends HookWidget {
  const _ChatMsgsSection(
    this.id,
  );
  final int id;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          context.read<UserMessagesBloc>().add(UserMsgsPaginationEvent(id));
        }
      });
      return;
    }, [scrollController]);
    return BlocBuilder<UserMessagesBloc, UserMessagesState>(
      builder: (context, state) {
        return Expanded(
          child: WrapService(
            status: state.status,
            loading: ShimmerLoading(
              enabled: state.status == const ResponseStatus.loading(),
              type: PageType.withoutDivider,
            ),
            child: AnimationLimiter(
              child: ListView.separated(
                controller: scrollController,
                reverse: true,
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
                              child: _MessageItem(
                                state.chats[index],
                              ),
                            ),
                          ),
                        );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemCount: state.hasReachedMax
                    ? state.chats.length
                    : state.chats.length + 1,
              ),
            ),
          ),
        );
      },
    );
  }
}
