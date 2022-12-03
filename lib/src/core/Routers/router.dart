import 'package:flutter/material.dart';
import 'package:zido/src/app/features/chat/views/pages/chat_room.dart';
import 'package:zido/src/app/features/chat/views/pages/user_chats_page.dart';

import '../../app/features/auth/views/pages/login_page.dart';
import 'route_name.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/${RouteName.loginPage}':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/${RouteName.chatsPage}':
        return MaterialPageRoute(builder: (_) => const UserChatsPage());
      case '/${RouteName.chatRoomPage}':
        return MaterialPageRoute(builder: (_) => const ChatRoomPage());
      // case '/${RouteName.}':
      // return MaterialPageRoute(builder: (_) => const ());
      // case '/${}':
      // return MaterialPageRoute(builder: (_) =>const ());
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScaffold(
            body: Text('Error Page Route'),
          ),
        );
    }
  }
}

class ErrorScaffold extends StatelessWidget {
  const ErrorScaffold({
    required this.body,
    Key? key,
  }) : super(key: key);

  final Widget body;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Page Not Found'),
        ),
        body: body,
      );
}
