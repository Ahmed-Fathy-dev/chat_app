import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:zido/src/app/features/chat/logic/repo/chat_repo.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../../../../../core/network_service/exception_dio_message.dart';
import '../../../../../../core/network_service/response_status.dart';
import '../../../../../../core/utils/logger_util.dart';
import '../../model/response_models/chats_model_response.dart';

part 'user_chats_event.dart';
part 'user_chats_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class UserChatsBloc extends Bloc<UserChatsEvent, UserChatsState> {
  final ChatServiceRepo _repo;
  UserChatsBloc(this._repo) : super(const UserChatsState()) {
    on<UserChatsEvent>(_onGetChats);
  }

  Future<void> _onGetChats(
      UserChatsEvent event, Emitter<UserChatsState> emit) async {
    if (state.hasReachedMax) return;
    emit(
      state.copyWith(
        status: const ResponseStatus.loading(),
      ),
    );
    final response = await _repo.getUserChatsRepo(1);

    response.fold(
      (failure) {
        logger.e(failure.message);
        if (failure == Failure.noInternetConnection()) {
          emit(
            state.copyWith(
              status: const ResponseStatus.noInternetC(),
            ),
          );
        } else {
          emit(
            state.copyWith(
              status: const ResponseStatus.error(),
            ),
          );
        }
      },
      (success) {
        emit(
          state.copyWith(
            status: const ResponseStatus.success(),
            chats: success.chats!.data
          ),
        );
      },
    );
  }
}
