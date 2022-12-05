import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zido/src/core/network_service/network_service.dart';

import '../../../../../core/local_storage/storage_keys.dart';
import '../../../../../core/network_service/api_urls.dart';
import '../../../../../core/network_service/exception_dio_message.dart';
import '../model/Response_models/auth_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModelResponse>> loginRepo({
    required String email,
    required String password,
  });
}

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl(this._netService);
  final NetworkService _netService;

  @override
  Future<Either<Failure, AuthModelResponse>> loginRepo({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _netService.post(
        ApiUrls.login,
        data: <String, dynamic>{
          "lang": "en",
          "password": password,
          "device_type": "Android",
          "email": email,
          "device_token": StorageKeys.dToken,
        },
      );
      return Right(AuthModelResponse.fromJson(response.data));
    } on DioError catch (e) {
      return Left(Failure.fromCode(e));
    }
  }
}
