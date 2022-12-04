part of 'user_chats_bloc.dart';

class UserChatsState extends Equatable {
  const UserChatsState({
    this.status = const ResponseStatus.initial(),
    this.paginationStatus = const ResponseStatus.initial(),
    this.chats = const <UserChat>[],
    this.hasReachedMax = false,
    this.currentPage = 1,
  });
  final ResponseStatus status;
  final ResponseStatus paginationStatus;
  final List<UserChat> chats;
  final bool hasReachedMax;
  final int currentPage;
  UserChatsState copyWith({
    ResponseStatus? status,
    ResponseStatus? paginationStatus,
    List<UserChat>? chats,
    bool? hasReachedMax,
    int? currentPage,
  }) {
    return UserChatsState(
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
