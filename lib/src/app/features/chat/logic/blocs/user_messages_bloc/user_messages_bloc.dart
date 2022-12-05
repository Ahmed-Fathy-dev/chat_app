import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:zido/src/app/features/chat/logic/repo/chat_repo.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../../../../../core/network_service/exception_dio_message.dart';
import '../../../../../../core/network_service/response_status.dart';
import '../../../../../../core/network_service/socket_service.dart';
import '../../../../../../core/utils/logger_util.dart';
import '../../model/request_models/messages_model_request.dart';
import '../../model/request_models/register_socket_model.dart';
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
  final SocketService _socket;
  UserMessagesBloc(this._repo, this._socket)
      : super(const UserMessagesState()) {
    on<GetUserMessagesEvent>(_onGetMessages);
    on<ResetEvent>(_onReset);
    // on<RegisterSocketEvent>(_onRegisterSocket);
    on<UserMsgsPaginationEvent>(
      _onPaginationChats,
      transformer: throttleDroppable(throttleDuration),
    );
    on<RegisterSocketEvent>(_onRegisterSocket);
    on<SendMessageEvent>(_onSendMsg);
    on<AddMessageEvent>(_onAddMsg);
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
                  chats: List.of(state.chats)
                    ..addAll(success.messages!.data),
                  hasReachedMax: false,
                ),
              );
      },
    );
  }

  void _onReset(ResetEvent event, Emitter<UserMessagesState> emit) {
    // _socket.disconnect();
    emit(state.copyWith(
      status: const ResponseStatus.initial(),
      paginationStatus: const ResponseStatus.initial(),
      chats: const <UserMessages>[],
      hasReachedMax: false,
      currentPage: 1,
    ));
  }

  void _onRegisterSocket(
    RegisterSocketEvent event,
    Emitter<UserMessagesState> emit,
  ) async {
    final channel = _socket.sucscribeChannel();
    // channel.sink.add(
    //   jsonEncode(event.registerSoc.toJson()),
    // );
    // channel.sink.add(
    //   '{"event": "messageTo","data": {"user_id": 2050,"to":1768, "content": "Hello from client id 2050","image": ""}}',
    // );
    channel.sink.add(
      '{"event": "register","data": {"user_id": 1768}}',
    );
    channel.stream.listen((event) {
      logWtf('listen');
      logger.wtf(event.toString());
      final RegisteryModel dataEvent =
          RegisteryModel.fromJson(jsonDecode(event));
      logger.wtf(dataEvent, 'from bloc');
      if (dataEvent.event == 'message') {
        logger.wtf(dataEvent.message);
      } else if (dataEvent.event == 'messageTo') {
        logger.wtf(dataEvent.toString());
        final MessageModelRes data =
            MessageModelRes.fromJson(jsonDecode(event));
        logger.wtf(data.data.toString());
        add(
          AddMessageEvent(
            UserMessages(
              userId: data.data!.userId,
              image: data.data!.image,
              txt: data.data!.content,
            ),
          ),
        );
        // emit(
        //   state.copyWith(
        //     chats: List.of(state.chats)
        //       ..add(UserMessages(
        //         userId: data.data!.userId,
        //         image: data.data!.image,
        //         txt: data.data!.content,
        //       )),
        //   ),
        // );
      }
    }, onDone: () {
      logWtf('done');
    }, cancelOnError: true);
  }

  void _onSendMsg(
    SendMessageEvent event,
    Emitter<UserMessagesState> emit,
  ) {
    final channel = _socket.sucscribeChannel();
    // channel.sink.add(
    //   jsonEncode(event.msg.toJson()),
    // );
    channel.sink.add(
      '{"event": "messageTo","data": {"user_id": 2050,"to":1768, "content": "Hello from client id 1768","image": ""}}',
    );
    add(
      AddMessageEvent(
        UserMessages(
          userId: 1768,
          txt: 'Hello from client id 1768',
          image: '',
        ),
      ),
    );
  }
//   void onClose() {
//     _socket.disconnect();
//   }

  @override
  Future<void> close() async {
    super.close();
    return _socket.disconnect();
  }

  void _onAddMsg(
    AddMessageEvent event,
    Emitter<UserMessagesState> emit,
  ) {
    emit(
      state.copyWith(
        chats: List.of(state.chats)
          ..add(UserMessages(
            userId: event.msg.userId,
            image: event.msg.image,
            txt: event.msg.txt,
          )),
      ),
    );
  }
}
