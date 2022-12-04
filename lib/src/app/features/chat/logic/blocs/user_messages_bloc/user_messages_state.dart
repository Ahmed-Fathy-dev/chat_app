part of 'user_messages_bloc.dart';

class UserMessagesState extends Equatable {
  const UserMessagesState({
    this.status = const ResponseStatus.initial(),
    this.paginationStatus = const ResponseStatus.initial(),
    this.chats = const <UserMessages>[],
    this.hasReachedMax = false,
    this.currentPage = 1,
  });
  final ResponseStatus status;
  final ResponseStatus paginationStatus;
  final List<UserMessages> chats;
  final bool hasReachedMax;
  final int currentPage;

  UserMessagesState copyWith({
    ResponseStatus? status,
    ResponseStatus? paginationStatus,
    List<UserMessages>? chats,
    bool? hasReachedMax,
    int? currentPage,
  }) {
    return UserMessagesState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      paginationStatus: paginationStatus ?? this.paginationStatus,
      currentPage: currentPage ?? this.currentPage,
      //-- : -- ?? this.--,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${chats.length} , pagStatus: $paginationStatus} , curruntPage: $currentPage}''';
  }

  @override
  List<Object?> get props => [
        status,
        chats,
        hasReachedMax,
        paginationStatus,
        currentPage,
      ];
}
