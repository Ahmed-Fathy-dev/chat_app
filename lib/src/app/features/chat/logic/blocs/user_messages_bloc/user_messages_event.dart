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

class RegisterSocketEvent extends UserMessagesEvent {
  final RegisterSocket registerSoc;

  RegisterSocketEvent(this.registerSoc);
  @override
  List<Object?> get props => [registerSoc];
}

class SendMessageEvent extends UserMessagesEvent {
  final MessageModel msg;

  SendMessageEvent(this.msg);
  @override
  List<Object?> get props => [msg];
}

class AddMessageEvent extends UserMessagesEvent {
  final UserMessages msg;

  AddMessageEvent(this.msg);
  @override
  List<Object?> get props => [msg];
}

class ResetEvent extends UserMessagesEvent {}
