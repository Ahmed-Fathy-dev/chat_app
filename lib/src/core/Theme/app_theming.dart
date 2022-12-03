import 'package:flutter/material.dart';

part 'color_scheme_theme.dart';
part 'widget_app_theme.dart';

// part './widget_app_theme.dart';

class AppThemeData {
  static ThemeData get darkThemeData => _themeData(
        colorScheme: AppColorScheme.darkColorScheme,
        // textTheme: GoogleFonts.spaceMonoTextTheme(ThemeData.dark().textTheme),
      );
  static ThemeData get lightThemeData => _themeData(
        colorScheme: AppColorScheme.lightColorScheme,
      );

  static ThemeData _themeData({
    required ColorScheme colorScheme,
    TextTheme? textTheme,
  }) =>
      ThemeData.from(
        colorScheme: colorScheme,
        textTheme: textTheme,
      ).copyWith(
          useMaterial3: true,
          appBarTheme: WidgetAppTheme.appBarTheme(colorScheme),
          // elevatedButtonTheme: WidgetAppTheme.elevatedButton(colorScheme),
          inputDecorationTheme: WidgetAppTheme.inputDecoration(colorScheme));
}
