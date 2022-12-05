import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zido/src/core/utils/extensions_methods/assets_ext.dart';

import '../../core/enum/assets_enums.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({
    Key? key,
    required this.lottie,
    this.height,
    /* this.width, */
  }) : super(key: key);
  final AppLotties lottie;
  final double? height;
  // final double? width;
  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      lottie.fullPathjson,
      height: height ?? 150,
      // width: width ?? 120,
      repeat: false,
      fit: BoxFit.contain,
    );
  }
}
