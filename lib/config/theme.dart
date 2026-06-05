import 'package:flutter/material.dart';

ColorScheme buildColorScheme(Brightness brightness) {
  return ColorScheme.fromSeed(
    seedColor: const Color(0xFF1A6BF0),
    brightness: brightness,
  );
}

final lightColorScheme = buildColorScheme(Brightness.light);
final darkColorScheme  = buildColorScheme(Brightness.dark);

final ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: lightColorScheme.surface,
    cardTheme: const CardThemeData(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
    ),
    chipTheme: ChipThemeData(
        backgroundColor: lightColorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        )
    )
);

final ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: darkColorScheme.surface,
    cardTheme: const CardThemeData(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
    ),
    chipTheme: ChipThemeData(
        backgroundColor: darkColorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        )
    )
);