part of '../pages/user_chats_page.dart';

class _ChatItem extends StatelessWidget {
  const _ChatItem({
    required this.onTap,
  });
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _AvatarWidget(),
            const SizedBox(width: 12),
            _RoomDetailsWidget(),
          ],
        ),
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget();

  @override
  Widget build(BuildContext context) {
    return const ClipOval(
      child: ImageNet(
        '',
        height: 60,
        width: 60,
      ),
    );
  }
}

class _RoomDetailsWidget extends StatelessWidget {
  const _RoomDetailsWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Someone Name',
            style: context.txtTheme.titleMedium?.copyWith(
              fontSize: 14,
              color: context.colorSchemes.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '@someoneusername',
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
                  'This is just random message, writing',
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
