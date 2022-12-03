import 'package:flutter/material.dart';

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
