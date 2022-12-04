part of '../pages/chat_room.dart';

class _MessageItem extends StatelessWidget {
  const _MessageItem(this.msgs);
  final UserMessages msgs;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: msgs.userId.checkMsgDir(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _AvatarWidget(msgs.image),
            const SizedBox(
              width: 12,
            ),
            _MessageDetailsWidget(msgs),
          ],
        ),
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget(this.img);
  final String img;
  @override
  Widget build(BuildContext context) {
    return const ClipOval(
      child: ImageNet(
        '',
        height: 45,
        width: 45,
      ),
    );
  }
}

class _MessageDetailsWidget extends StatelessWidget {
  const _MessageDetailsWidget(this.msgs);
  final UserMessages msgs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: msgs.userId.boxColor(context),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    msgs.name,
                    style: TextStyle(
                      fontSize: 12,
                      color: msgs.userId.textColor(context),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  ClipOval(
                    child: Container(
                      color: context.colorSchemes.primary,
                      width: 12,
                      height: 12,
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 8,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                msgs.txt,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '9.53 am',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
