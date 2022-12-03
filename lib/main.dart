import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'bootstrap.dart';
import 'src/root/app_bloc_observer.dart';
import 'src/root/app_root.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> checkAndroidVersion() async {
  if (Platform.isAndroid) {
    final version = await DeviceInformation.apiLevel; 
    if (version >= 24) {
      HttpOverrides.global = MyHttpOverrides();
    }
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await checkAndroidVersion();
  bootstrap(() => const AppRoot());
}

