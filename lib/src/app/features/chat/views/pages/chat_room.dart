import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:zido/src/core/Routers/routes.dart';
import 'package:zido/src/core/utils/extensions_methods/app_extensions_m.dart';
import 'package:zido/src/injection/injection_container.dart';

import '../../../../../core/constants/strings.dart';
import '../../../../components/custom_appbar.dart';
import '../../../../components/image_net.dart';
import '../../logic/blocs/user_messages_bloc/user_messages_bloc.dart';

part '../widgets/chat_msgs_section.dart';
part '../widgets/message_input_section.dart';
part '../widgets/message_item.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({
    super.key,
    this.receiverId,
  });
  final int? receiverId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserMessagesBloc>(
      create: (context) =>
          injector<UserMessagesBloc>()..add(GetUserMessagesEvent(receiverId!)),
      child: Scaffold(
        appBar: CustomAppBar(
          ctx: context,
          title: AppStrings.messagesPageTitle,
          leadingColor: Colors.white,
          onLeadingPressed: () => context.pop(),
        ),
        body: _ChatRoomBody(receiverId!),
      ),
    );
  }
}

class _ChatRoomBody extends StatelessWidget {
  const _ChatRoomBody(this.id);
  final int id;
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
