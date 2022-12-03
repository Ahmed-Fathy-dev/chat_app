part of '../pages/chat_room.dart';

class _MessageItem extends StatelessWidget {
  const _MessageItem();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      //TODO:check user for set direction
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _AvatarWidget(),
            const SizedBox(
              width: 12,
            ),
            _MessageDetailsWidget(),
          ],
        ),
      ),
    );
  }
}

class _AvatarWidget extends _MessageItem {
  const _AvatarWidget();

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

class _MessageDetailsWidget extends _MessageItem {
  const _MessageDetailsWidget();

  Color boxColor(BuildContext ctx) {
    //TODO:check user for set boxColor
    return ctx.colorSchemes.primaryContainer;
  }

  Color textColor(BuildContext ctx) {
    //TODO:check user for set textColor
    return ctx.colorSchemes.primary;
  }

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
            color: boxColor(context),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'ahmed salem',
                    style: TextStyle(
                      fontSize: 12,
                      color: textColor(context),
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
                'It’s in a very good condition, no scratches at all👌 ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '9.53 am',
                    style: TextStyle(
                      fontSize: 12,
                      color: textColor(context),
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
