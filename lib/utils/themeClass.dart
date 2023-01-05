// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData.from(
    colorScheme: const ColorScheme.light(),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  );

  static ThemeData darkTheme = ThemeData.from(
    colorScheme: const ColorScheme.dark(),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
