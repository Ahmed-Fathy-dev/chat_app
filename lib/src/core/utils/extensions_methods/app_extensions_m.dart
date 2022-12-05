import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const FlutterSecureStorage _storage = FlutterSecureStorage();

extension ContextUtils on BuildContext {
  ColorScheme get colorSchemes {
    return Theme.of(this).colorScheme;
  }

  TextTheme get txtTheme {
    return Theme.of(this).textTheme;
  }

  Size get mediaQSize {
    return MediaQuery.of(this).size;
  }
}

extension CachMethods on String {
  void write(String key) {
    _storage.write(key: key, value: this);
  }

  Future<String?> read(String key) async {
    final value = await _storage.read(key: key);
    return value;
  }
}
