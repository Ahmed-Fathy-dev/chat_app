part of 'user_messages_bloc.dart';

abstract class UserMessagesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetUserMessagesEvent extends UserMessagesEvent {
  final int receiverId;

  GetUserMessagesEvent(this.receiverId);

  @override
  List<Object?> get props => [receiverId];
}

class UserMsgsPaginationEvent extends UserMessagesEvent {
  final int receiverId;

  UserMsgsPaginationEvent(this.receiverId);

  @override
  List<Object?> get props => [receiverId];
}
