import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:zido/src/app/features/chat/logic/repo/chat_repo.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../../../../../core/network_service/exception_dio_message.dart';
import '../../../../../../core/network_service/response_status.dart';
import '../../../../../../core/utils/logger_util.dart';
import '../../model/request_models/messages_model_request.dart';
import '../../model/response_models/chats_model_response.dart';
import '../../model/response_models/messages_model_response.dart';

part 'user_messages_event.dart';
part 'user_messages_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class UserMessagesBloc extends Bloc<UserMessagesEvent, UserMessagesState> {
  final ChatServiceRepo _repo;
  UserMessagesBloc(this._repo) : super(const UserMessagesState()) {
    on<GetUserMessagesEvent>(_onGetMessages);
    on<UserMsgsPaginationEvent>(
      _onPaginationChats,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  void _onGetMessages(
      GetUserMessagesEvent event, Emitter<UserMessagesState> emit) async {
    if (state.status == const ResponseStatus.initial()) {
      emit(
        state.copyWith(
          status: const ResponseStatus.loading(),
        ),
      );
      final response = await _repo.getUserMessagesRepo(
        MessagesModelRequest(
          receiverId: event.receiverId,
          page: 1,
          lang: 'en',
        ),
      );

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
              chats: success.messages!.data,
              currentPage: success.messages!.currentPage,
            ),
          );
        },
      );
    }
  }

  void _onPaginationChats(
      UserMsgsPaginationEvent event, Emitter<UserMessagesState> emit) async {
    if (state.hasReachedMax) return;
    emit(
      state.copyWith(
        paginationStatus: const ResponseStatus.loading(),
      ),
    );
    int page = state.currentPage;
    page += 1;

    final response = await _repo.getUserMessagesRepo(
      MessagesModelRequest(
        receiverId: event.receiverId,
        page: page,
        lang: 'en',
      ),
    );
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
        success.messages!.data.isEmpty
            ? emit(state.copyWith(hasReachedMax: true))
            : emit(
                state.copyWith(
                  status: const ResponseStatus.success(),
                  chats: List.of(state.chats)..addAll(success.messages!.data),
                  hasReachedMax: false,
                ),
              );
      },
    );
  }
}
