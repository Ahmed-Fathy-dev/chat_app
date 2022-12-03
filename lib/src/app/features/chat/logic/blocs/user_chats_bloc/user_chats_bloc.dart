import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/network_service/response_status.dart';

part 'user_chats_event.dart';
part 'user_chats_state.dart';

class UserChatsBloc extends Bloc<UserChatsEvent, UserChatsState> {
  UserChatsBloc() : super(UserChatsState()) {
    on<UserChatsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
