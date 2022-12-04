import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:zido/src/core/Routers/routes.dart';
import 'package:zido/src/core/utils/extensions_methods/app_ex_methods.dart';
import 'package:zido/src/core/utils/extensions_methods/app_extensions_m.dart';

import '../../../../../core/constants/strings.dart';
import '../../../../../core/enum/enums.dart';
import '../../../../../core/network_service/response_status.dart';
import '../../../../../core/network_service/wrap_service.dart';
import '../../../../components/custom_appbar.dart';
import '../../../../components/image_net.dart';
import '../../../../components/shimmer_loading.dart';
import '../../logic/blocs/user_messages_bloc/user_messages_bloc.dart';
import '../../logic/model/response_models/messages_model_response.dart';

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
    return Scaffold(
      appBar: CustomAppBar(
        ctx: context,
        title: AppStrings.messagesPageTitle,
        leadingColor: Colors.white,
        onLeadingPressed: () => context.pop(),
      ),
      body: _ChatRoomBody(receiverId!),
    );
  }
}

class _ChatRoomBody extends StatelessWidget {
  const _ChatRoomBody(this.id);
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserMessagesBloc, UserMessagesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              _MessageInput(),
              const SizedBox(
                height: 30,
              ),
              _ChatMsgsSection(id),
            ].reversed.toList(),
          ),
        );
      },
    );
  }
}
