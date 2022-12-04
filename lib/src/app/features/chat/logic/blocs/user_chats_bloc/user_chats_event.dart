part of 'user_chats_bloc.dart';

abstract class UserChatsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserChatsEvent extends UserChatsEvent {}

class UserChatsPaginationEvent extends UserChatsEvent {
  // final int page;

  // UserChatsPaginationEvent(this.page);
  // @override
  // List<Object?> get props => [page];
}
