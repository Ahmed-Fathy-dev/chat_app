import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zido/src/core/utils/extensions_methods/app_extensions_m.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    required BuildContext ctx,
    void Function()? onLeadingPressed,
    Color? leadingColor,
    Widget? leading,
    bool automaticallyImplyLeading = true,
    required String title,
    List<Widget>? actions,
    Widget? flexibleSpace,
    PreferredSizeWidget? bottom,
    double? elevation,
    double? scrolledUnderElevation,
    bool Function(ScrollNotification) notificationPredicate =
        defaultScrollNotificationPredicate,
    Color? shadowColor,
    Color? surfaceTintColor,
    ShapeBorder? shape,
    Color? backgroundColor,
    Color? foregroundColor,
    Brightness? brightness,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    TextTheme? textTheme,
    bool primary = true,
    bool? centerTitle,
    bool excludeHeaderSemantics = false,
    double? titleSpacing,
    double toolbarOpacity = 1.0,
    double bottomOpacity = 1.0,
    double? toolbarHeight,
    double? leadingWidth,
    bool? backwardsCompatibility,
    TextStyle? toolbarTextStyle,
    TextStyle? titleTextStyle,
    SystemUiOverlayStyle? systemOverlayStyle,
  }) : super(
          title: Text(
            title,
            style: ctx.txtTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            onPressed: onLeadingPressed,
            icon: Icon(
              Icons.arrow_back,
              color: leadingColor ?? Colors.transparent,
            ),
          ),
          actions: actions,
          centerTitle: true,
          bottom: bottom,
        );
}
