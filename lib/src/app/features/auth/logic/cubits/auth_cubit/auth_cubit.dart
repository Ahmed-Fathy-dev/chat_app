
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/network_service/exception_dio_message.dart';
import '../../../../../../core/network_service/response_status.dart';
import '../../model/Response_models/auth_model.dart';
import '../../repo/repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repo) : super(const AuthState());
  final AuthRepo _repo;
  void onFormSubmitted({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: const ResponseStatus.loading()));

    final response = await _repo.loginRepo(email: email, password: password);

    response.fold((failure) {
      if (failure == Failure.noInternetConnection()) {
        emit(state.copyWith(status: const ResponseStatus.noInternetC()));
      } else {
        emit(
          state.copyWith(
            status: const ResponseStatus.error(),
            message: failure.message,
          ),
        );
      }
    }, (success) {
      if (success.status == HttpStatus.ok) {
        emit(
          state.copyWith(
            status: const ResponseStatus.success(),
            authM: success.data,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: const ResponseStatus.error(),
            message: success.message,
          ),
        );
      }
    });
  }
}
