part of '../pages/chat_room.dart';

class _MessageInput extends HookWidget {
  const _MessageInput();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: context.colorSchemes.primaryContainer,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextFormField(),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 65,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorSchemes.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: () {},
              child: const Text(
                AppStrings.sendMessage,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
