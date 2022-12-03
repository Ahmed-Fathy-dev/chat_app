part of 'user_chats_bloc.dart';

class UserChatsState extends Equatable {
  const UserChatsState({
    this.status = const ResponseStatus.initial(),
    this.chats = const <UserChat>[],
    this.hasReachedMax = false,
  });
  final ResponseStatus status;
  final List<UserChat> chats;
  final bool hasReachedMax;
  UserChatsState copyWith({
    ResponseStatus? status,
    List<UserChat>? chats,
    bool? hasReachedMax,
  }) {
    return UserChatsState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      //-- : -- ?? this.--,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${chats.length} }''';
  }

  @override
  List<Object?> get props => [
        status,
        chats,
        hasReachedMax,
      ];
}
