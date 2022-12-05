
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:zido/src/app/components/shimmer_loading.dart';
import 'package:zido/src/app/components/switcher_widget.dart';
import 'package:zido/src/app/features/chat/logic/blocs/send_message_bloc/send_message_bloc.dart';
import 'package:zido/src/core/Routers/routes.dart';
import 'package:zido/src/core/utils/extensions_methods/app_ex_methods.dart';
import 'package:zido/src/core/utils/extensions_methods/app_extensions_m.dart';
import 'package:zido/src/injection/injection_container.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/enum/enums.dart';
import '../../../../../core/network_service/response_status.dart';
import '../../../../../core/network_service/wrap_service.dart';
import '../../../../components/custom_appbar.dart';
import '../../../../components/image_net.dart';
import '../../logic/blocs/user_chats_bloc/user_chats_bloc.dart';
import '../../logic/blocs/user_messages_bloc/user_messages_bloc.dart';
import '../../logic/model/request_models/register_socket_model.dart';
import '../../logic/model/response_models/chats_model_response.dart';
import 'chat_room.dart';

part '../widgets/chat_item.dart';
part '../widgets/chats_list.w.dart';

class UserChatsPage extends StatelessWidget {
  const UserChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserChatsBloc>(
      create: (context) => injector<UserChatsBloc>()..add(GetUserChatsEvent()),
      child: Scaffold(
        appBar: CustomAppBar(
          ctx: context,
          title: AppStrings.chatsPageTitle,
          bottom: PreferredSize(
            preferredSize: const Size(0, 40),
            child: Container(
              color: context.colorSchemes.primaryContainer,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    AppStrings.recieveMessages,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SwitcherWidget(),
                ],
              ),
            ),
          ),
        ),
        body: const _UserChatsBody(),
      ),
    );
  }
}

class _UserChatsBody extends HookWidget {
  const _UserChatsBody();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserChatsBloc, UserChatsState, ResponseStatus>(
      selector: (state) {
        return state.status;
      },
      builder: (context, status) {
        return WrapService(
          status: status,
          loading: ShimmerLoading(
            enabled: status == const ResponseStatus.loading(),
            type: PageType.withDivider,
          ),
          child: const AnimationLimiter(
            child: _ChatsListWidget(),
          ),
        );
      },
    );
  }
}
