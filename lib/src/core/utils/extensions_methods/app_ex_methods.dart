import 'package:flutter/material.dart';
import 'package:zido/src/core/utils/extensions_methods/app_extensions_m.dart';

extension CheckingNullOrEmpty on String? {
  String checkString(
    String alternativeString,
  ) {
    if (this != null) {
      if (this!.isNotEmpty) {
        return this!;
      } else {
        return alternativeString;
      }
    } else {
      return alternativeString;
    }
  }
}

extension CheckUserId on int {
  TextDirection checkMsgDir() {
    if (this == 1768) {
      return TextDirection.rtl;
    } else {
      return TextDirection.ltr;
    }
  }

  Color boxColor(BuildContext ctx) {
    if (this == 1768) {
      return ctx.colorSchemes.primaryContainer;
    } else {
      return ctx.colorSchemes.secondaryContainer;
    }
  }

  Color textColor(BuildContext ctx) {
    if (this == 1768) {
      return ctx.colorSchemes.primary;
    } else {
      return ctx.colorSchemes.secondary;
    }
  }
}
