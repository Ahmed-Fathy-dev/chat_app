import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import '../core/network_service/api_urls.dart';
import '../core/network_service/dio_service.dart';
import '../core/network_service/network_service.dart';

final injector = GetIt.instance;

class InjectorFile {
  Future<void> injectorFile() async {
    _service;
  }
}

// Service
void get _service async {
  //TODO: Add Token Here [token]
  Dio dioFactory = await DioFactory(Dio()).createDio(
    ApiUrls.baseUrlApi,
    ApiUrls.keyHeaderToken,
  );

  injector.registerSingleton<Dio>(dioFactory);
  injector.registerSingleton<NetworkService>(NetworkServiceImpl(dioFactory));
}
