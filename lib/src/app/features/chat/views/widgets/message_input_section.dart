part of '../pages/chat_room.dart';

class _MessageInput extends HookWidget {
  const _MessageInput();

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final contState = useState<String>(controller.text);
    return Container(
      padding: const EdgeInsets.all(16),
      color: context.colorSchemes.primaryContainer,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: CustomChatField(
                fieldKey: 'chat',
                name: 'Type Your Message',
                controller: controller,
                onChanged: (val) {
                  if (val != null) {
                    contState.value = val;
                  }
                },
              ),
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
              onPressed: controller.text.isEmpty
                  ? null
                  : () {
                      context.read<UserMessagesBloc>().add(
                            SendMessageEvent(
                              MessageModel(
                                content: controller.text,
                                userId: 1768,
                                to: 2050,
                                image: '',
                              ),
                            ),
                          );
                    },
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
