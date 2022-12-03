import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:zido/src/app/components/switcher_widget.dart';
import 'package:zido/src/core/Routers/routes.dart';
import 'package:zido/src/core/utils/extensions_methods/app_extensions_m.dart';

import '../../../../../core/Routers/route_name.dart';
import '../../../../../core/constants/strings.dart';
import '../../../../components/custom_appbar.dart';
import '../../../../components/image_net.dart';

part '../widgets/chat_item.dart';

class UserChatsPage extends StatelessWidget {
  const UserChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

class _UserChatsBody extends StatelessWidget {
  const _UserChatsBody();

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: _ChatItem(
                  onTap: () => context.pushName(RouteName.chatRoomPage),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 5,
      ),
    );
  }
}
