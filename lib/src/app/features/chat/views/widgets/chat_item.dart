part of '../pages/user_chats_page.dart';

class _ChatItem extends StatelessWidget {
  const _ChatItem({
    required this.onTap,
    required this.userChat,
  });
  final void Function() onTap;
  final UserChat userChat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _AvatarWidget(userChat.receiverImg!),
            const SizedBox(width: 12),
            _RoomDetailsWidget(userChat),
          ],
        ),
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget(this.image);
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: ImageNet(
        image,
        height: 60,
        width: 60,
      ),
    );
  }
}

class _RoomDetailsWidget extends StatelessWidget {
  const _RoomDetailsWidget(this.userChat);
  final UserChat userChat;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userChat.receiverName.checkString(
              'Fake Name',
            ),
            style: context.txtTheme.titleMedium?.copyWith(
              fontSize: 14,
              color: context.colorSchemes.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            userChat.receiverUsername.checkString(
              '@FakeUsername',
            ),
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF262A33),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  userChat.msgTxt.checkString(
                    'Fake Message',
                  ),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF262A33),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ClipOval(
                child: Container(
                  width: 16,
                  height: 16,
                  alignment: Alignment.center,
                  color: context.colorSchemes.primary,
                  child: const Text(
                    '2',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
