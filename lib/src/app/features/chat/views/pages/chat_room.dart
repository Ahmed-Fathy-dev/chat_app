import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:zido/src/core/Routers/routes.dart';
import 'package:zido/src/core/utils/extensions_methods/app_extensions_m.dart';

import '../../../../../core/constants/strings.dart';
import '../../../../components/custom_appbar.dart';
import '../../../../components/image_net.dart';

part '../widgets/chat_msgs_section.dart';
part '../widgets/message_input_section.dart';
part '../widgets/message_item.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        ctx: context,
        title: AppStrings.messagesPageTitle,
        leadingColor: Colors.white,
        onLeadingPressed: () => context.pop(),
      ),
      body: const _ChatRoomBody(),
    );
  }
}

class _ChatRoomBody extends ChatRoomPage {
  const _ChatRoomBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          _ChatMsgsSection(),
          const SizedBox(
            height: 30,
          ),
          _MessageInput(),
        ],
      ),
    );
  }
}
