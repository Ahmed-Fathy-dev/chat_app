part of 'user_chats_bloc.dart';

abstract class UserChatsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserChatsEvent extends UserChatsEvent {}
