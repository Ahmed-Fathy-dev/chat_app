import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import '../app/features/chat/logic/blocs/user_chats_bloc/user_chats_bloc.dart';
import '../app/features/chat/logic/blocs/user_messages_bloc/user_messages_bloc.dart';
import '../app/features/chat/logic/repo/chat_repo.dart';
import '../core/network_service/api_urls.dart';
import '../core/network_service/dio_service.dart';
import '../core/network_service/network_service.dart';

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

  injector.registerSingleton<Dio>(dioFactory);
  injector.registerSingleton<NetworkService>(NetworkServiceImpl(dioFactory));
}

// chat Service 
void get _chatService {
  injector.registerLazySingleton<ChatServiceRepo>(
    () => ChatServiceRepoImpl(injector<NetworkService>()),
  );
  injector.registerFactory<UserChatsBloc>(
    () => UserChatsBloc(
      injector<ChatServiceRepo>(),
    ),
  );
  injector.registerFactory<UserMessagesBloc>(
    () => UserMessagesBloc(
      injector<ChatServiceRepo>(),
    ),
  );
}
