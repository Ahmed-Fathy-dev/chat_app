import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:zido/src/app/components/shimmer_loading.dart';
import 'package:zido/src/app/components/switcher_widget.dart';
import 'package:zido/src/core/Routers/routes.dart';
import 'package:zido/src/core/utils/extensions_methods/app_ex_methods.dart';
import 'package:zido/src/core/utils/extensions_methods/app_extensions_m.dart';
import 'package:zido/src/injection/injection_container.dart';

import '../../../../../core/Routers/route_name.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../../core/enum/enums.dart';
import '../../../../../core/network_service/response_status.dart';
import '../../../../../core/network_service/wrap_service.dart';
import '../../../../components/custom_appbar.dart';
import '../../../../components/image_net.dart';
import '../../logic/blocs/user_chats_bloc/user_chats_bloc.dart';
import '../../logic/model/response_models/chats_model_response.dart';

part '../widgets/chat_item.dart';

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

class _UserChatsBody extends StatelessWidget {
  const _UserChatsBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserChatsBloc, UserChatsState>(
      builder: (context, state) {
        return WrapService(
          status: state.status,
          loading: ShimmerLoading(
            enabled: state.status == const ResponseStatus.loading(),
            type: PageType.withDivider,
          ),
          child: AnimationLimiter(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: _ChatItem(
                        onTap: () => context.pushName(
                          RouteName.chatRoomPage,
                        ),
                        userChat: state.chats[index],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.chats.length,
              // itemCount: 6,
            ),
          ),
        );
      },
    );
  }
}
