part of '../pages/chat_room.dart';

class _ChatMsgsSection extends _ChatRoomBody {
  const _ChatMsgsSection();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
        child: ListView.separated(
          dragStartBehavior: DragStartBehavior.down,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: _MessageItem(
                      // onTap: () => context.pushName(RouteName.chatRoomPage),
                      ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          itemCount: 5,
        ),
      ),
    );
  }
}
