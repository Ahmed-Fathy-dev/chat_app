part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.status = const ResponseStatus.initial(),
    this.message = '',
    this.authM,
  });
  final ResponseStatus status;
  final String message;
  final AuthModel? authM;
  
  AuthState copyWith({
    ResponseStatus? status,
    String? message,
    AuthModel? authM,
  }) {
    return AuthState(
      status: status ?? this.status,
      message: message ?? this.message,
      authM : authM ?? this.authM,
      //-- : -- ?? this.--,
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
        authM,
      ];
}
