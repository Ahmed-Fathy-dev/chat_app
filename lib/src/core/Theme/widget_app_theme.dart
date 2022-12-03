part of './app_theming.dart';

mixin WidgetAppTheme {
  static AppBarTheme appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      // toolbarHeight: 50,
      // titleTextStyle: TextStyle(
      //   fontSize: 20,
      //   color: colorScheme.onSurface,
      // ),
      // actionsIconTheme: IconThemeData(color: colorScheme.onPrimary),
      // iconTheme: IconThemeData(color: colorScheme.onPrimary),
      color: colorScheme.primary,
      // shadowColor: Colors.transparent,
      // elevation: 0,
      // iconTheme: IconThemeData(color: colorScheme.primary),
    );
  }

  // static BottomNavigationBarThemeData bottomNavBar(colorScheme) {
  //   return BottomNavigationBarThemeData(
  //     type: BottomNavigationBarType.fixed,
  //     showSelectedLabels: false,
  //     showUnselectedLabels: false,
  //     selectedItemColor: colorScheme.onPrimary,
  //     unselectedItemColor: colorScheme.secondaryVariant,
  //   );
  // }

  // static TabBarTheme tabBarTheme(colorScheme) {
  //   return TabBarTheme(
  //     labelColor: colorScheme.primary,
  //     labelPadding: const EdgeInsets.symmetric(horizontal: 3),
  //     indicator: BoxDecoration(
  //       borderRadius: BorderRadius.circular(100),
  //       color: colorScheme.secondary,
  //     ),
  //     unselectedLabelColor: colorScheme.secondaryVariant,
  //   );
  // }
  static ElevatedButtonThemeData elevatedButton(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        // primary: colorScheme.primary,
        // onPrimary: colorScheme.onPrimary,
        // minimumSize: const Size(300, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // textStyle: ThemeData()
        //     .textTheme
        //     .headline4
        //     ?.copyWith(fontWeight: FontWeight.w700, color: Colors.black),
      ),
    );
  }

  // // static DataTableThemeData dataTableDecoration() {
  // //   return DataTableThemeData(
  // //     headingTextStyle: TextStyle(fontWeight: FontWeight.bold),
  // //     dividerThickness: 1,
  // //     decoration: const ShapeDecoration(
  // //       color: Colors.black,
  // //       shape: Border.symmetric(
  // //         vertical: BorderSide(
  // //           color: Colors.black,
  // //         ),
  // //       ),
  // //     ),
  // //     headingRowColor: MaterialStateProperty.resolveWith<Color?>(
  // //         (Set<MaterialState> states) {
  // //       if (states.contains(MaterialState.hovered)) {
  // //         Colors.blueGrey.shade100;
  // //       }
  // //       return null; // Use the default value.
  // //     }),
  // //   );
  // // }

  static InputDecorationTheme inputDecoration(ColorScheme colorScheme) {
    return InputDecorationTheme(
      // labelStyle: TextStyle(
      //   color: Colors.grey[400]!,
      //   fontSize: 14,
      //   // fontFamily: 'Almarai',
      // ),
      fillColor: Colors.white,
      focusColor: Colors.white,
      // hintStyle: TextStyle(
      //   color: Colors.black,
      //   fontSize: 14,
      //   // fontFamily: 'Almarai',
      // ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorScheme.onSurface.withOpacity(0.12),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorScheme.primary,
        ),
      ),
    );
  }
}
