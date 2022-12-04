import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:zido/src/core/utils/logger_util.dart';

import 'api_urls.dart';

class DioFactory {
  const DioFactory(this.dio);
  final Dio dio;

  /// @param {hasToken}
  /// this key is used to check if the request is not requires token
  /// @param {token}
  /// store key is 'token'.
  Future<Dio> createDio(
    String baseUrlName,
    String hasToken,
    // FlutterSecureStorage token,
  ) async {
    dio
      ..options.contentType = 'application/json; charset=UTF-8'
      ..options.baseUrl = baseUrlName
      ..options.connectTimeout = Duration.millisecondsPerMinute
      ..options.receiveTimeout = Duration.millisecondsPerMinute
      ..options.receiveDataWhenStatusError = true
      ..httpClientAdapter
      ..options.headers = <String, dynamic>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'app-version': '5.1.6',
      };
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
    }

    dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      if (options.headers.containsKey(hasToken)) {
        // final tokenStore = await token.read(key: 'token');

        options.headers.addAll({'Authorization': 'Bearer $constToken'});
        'Has Token ✅ $constToken ✅'.logI('Token 👌');
        return handler.next(options);
      } else {
        options.headers.remove(hasToken);
        options.headers;
        'Without Token 😁'.logI('');
        return handler.next(options);
      }
    }));
    return dio;
  }
}
