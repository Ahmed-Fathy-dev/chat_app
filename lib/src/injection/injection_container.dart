import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:web_socket_channel/io.dart';

import '../app/features/chat/logic/blocs/send_message_bloc/send_message_bloc.dart';
import '../app/features/chat/logic/blocs/user_chats_bloc/user_chats_bloc.dart';
import '../app/features/chat/logic/blocs/user_messages_bloc/user_messages_bloc.dart';
import '../app/features/chat/logic/repo/chat_repo.dart';
import '../app/features/chat/logic/repo/websocket_repo.dart';
import '../core/network_service/api_urls.dart';
import '../core/network_service/dio_service.dart';
import '../core/network_service/network_service.dart';
import '../core/network_service/socket_service.dart';
import '../core/utils/logger_util.dart';

final injector = GetIt.instance;

class InjectorFile {
  Future<void> injectorFile() async {
    _service;
    _chatService;
  }
}

// Service
void get _service async {
  //TODO: Add Token Here [token]
  Dio dioFactory = await DioFactory(Dio()).createDio(
    ApiUrls.baseUrlApi,
    ApiUrls.keyHeaderToken,
  );
  final channel = IOWebSocketChannel.connect(Uri.parse(ApiUrls.socketUri));

  injector.registerSingleton<IOWebSocketChannel>(channel);
  injector.registerSingleton<Dio>(dioFactory);
  injector.registerSingleton<NetworkService>(NetworkServiceImpl(dioFactory));
  injector.registerSingleton<SocketService>(
    SocketService(injector<IOWebSocketChannel>()),
  );
}

// chat Service
void get _chatService {
  injector.registerLazySingleton<ChatServiceRepo>(
    () => ChatServiceRepoImpl(injector<NetworkService>()),
  );
  // injector.registerLazySingleton<WebsocketRepo>(
  //   () => WebsocketRepoImpl(injector<SocketService>()),
  // );
  injector.registerFactory<UserChatsBloc>(
    () => UserChatsBloc(
      injector<ChatServiceRepo>(),
    ),
  );
  injector.registerFactory<UserMessagesBloc>(
    () => UserMessagesBloc(
      injector<ChatServiceRepo>(),
       injector<SocketService>(),
    ),
  );
  // injector.registerFactory<SendMessageBloc>(
  //   () => SendMessageBloc(
  //     injector<SocketService>(),
  //   ),
  // );
}
