part of 'user_chats_bloc.dart';

class UserChatsState extends Equatable {
  const UserChatsState({
    this.status = const ResponseStatus.initial(),
  });
  final ResponseStatus status;

  UserChatsState copyWith({
    ResponseStatus? status,
  }) {
    return UserChatsState(
      status: status ?? this.status,
      //-- : -- ?? this.--,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
