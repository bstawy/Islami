import 'package:flutter/material.dart';

class ApplicationTheme {
  static bool isDark = true;

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xffB7935F),
      primary: const Color(0xffB7935F),
      secondary: const Color(0xffF8F8F8),
      onSecondary: const Color(0xffB7935F),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Color(0xff242424),
        fontFamily: 'ElMessiri',
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(
        color: Color(0xff242424),
        size: 30,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xffB7935F),
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: Color(0xff242424), size: 32),
      selectedItemColor: Color(0xff242424),
      selectedLabelStyle: TextStyle(
        color: Color(0xff242424),
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xffF8F8F8),
        size: 28,
      ),
      unselectedItemColor: Color(0xffF8F8F8),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Color(0xff242424),
        fontFamily: 'ElMessiri',
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Color(0xff242424),
        fontFamily: 'Inter',
        fontSize: 25,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        color: Color(0xff242424),
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: Color(0xff242424),
        fontFamily: 'DecoType',
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
    ),
    dividerColor: const Color(0xffB7935F),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: const Color(0xffB7935F),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff141A2E),
      primary: const Color(0xff141A2E),
      secondary: const Color(0xff141A2E),
      onSecondary: const Color(0xffFACC1D),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Color(0xffF8F8F8),
        fontFamily: 'ElMessiri',
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(
        color: Color(0xffF8F8F8),
        size: 30,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff141A2E),
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: Color(0xffFACC1D), size: 32),
      selectedItemColor: Color(0xffFACC1D),
      selectedLabelStyle: TextStyle(
        color: Color(0xffFACC1D),
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xffF8F8F8),
        size: 28,
      ),
      unselectedItemColor: Color(0xffF8F8F8),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Color(0xffF8F8F8),
        fontFamily: 'ElMessiri',
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Color(0xffF8F8F8),
        fontFamily: 'Inter',
        fontSize: 25,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        color: Color(0xffF8F8F8),
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: Color(0xffF8F8F8),
        fontFamily: 'DecoType',
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
    ),
    dividerColor: const Color(0xffFACC1D),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Color(0xff141A2E),
    ),
  );
}
