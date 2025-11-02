import 'package:flutter/material.dart';

/// Application theme configuration
///
/// Provides consistent light and dark themes using Material 3 design
/// with a teal/cyan color scheme appropriate for temperature monitoring.
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  /// Seed color for generating the color scheme
  /// Teal/cyan is chosen for its association with temperature and monitoring
  static const Color _seedColor = Color(0xFF00838F); // Teal/cyan

  /// Light theme configuration
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,

      // Text theme with proper hierarchy
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.25,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.4,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 1.4,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
        ),
      ),

      // Card theme
      cardTheme: CardThemeData(
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // App bar theme
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      // Dialog theme
      dialogTheme: DialogThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),

      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Extensions
      extensions: <ThemeExtension<dynamic>>[
        TemperatureColors.light(colorScheme),
      ],
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,

      // Text theme (same hierarchy as light)
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.25,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          height: 1.4,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          height: 1.4,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
        ),
      ),

      // Card theme
      cardTheme: CardThemeData(
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // App bar theme
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),

      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),

      // Text button theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      // Dialog theme
      dialogTheme: DialogThemeData(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),

      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Extensions
      extensions: <ThemeExtension<dynamic>>[
        TemperatureColors.dark(colorScheme),
      ],
    );
  }
}

/// Custom theme extension for temperature-specific colors
///
/// Provides semantic colors for temperature-related UI elements
@immutable
class TemperatureColors extends ThemeExtension<TemperatureColors> {
  /// Color for hot temperature indicators
  final Color? hot;

  /// Color for cold temperature indicators
  final Color? cold;

  /// Color for warning states
  final Color? warning;

  /// Color for success states
  final Color? success;

  /// Color for sensor backgrounds
  final Color? sensorBackground;

  /// Color for sensor borders
  final Color? sensorBorder;

  const TemperatureColors({
    required this.hot,
    required this.cold,
    required this.warning,
    required this.success,
    required this.sensorBackground,
    required this.sensorBorder,
  });

  /// Light theme colors
  factory TemperatureColors.light(ColorScheme colorScheme) {
    return TemperatureColors(
      hot: Colors.deepOrange[400],
      cold: Colors.blue[400],
      warning: Colors.amber[600],
      success: Colors.green[600],
      sensorBackground: colorScheme.surfaceContainerHighest,
      sensorBorder: colorScheme.outlineVariant,
    );
  }

  /// Dark theme colors
  factory TemperatureColors.dark(ColorScheme colorScheme) {
    return TemperatureColors(
      hot: Colors.deepOrange[300],
      cold: Colors.blue[300],
      warning: Colors.amber[400],
      success: Colors.green[400],
      sensorBackground: colorScheme.surfaceContainerHighest,
      sensorBorder: colorScheme.outlineVariant,
    );
  }

  @override
  ThemeExtension<TemperatureColors> copyWith({
    Color? hot,
    Color? cold,
    Color? warning,
    Color? success,
    Color? sensorBackground,
    Color? sensorBorder,
  }) {
    return TemperatureColors(
      hot: hot ?? this.hot,
      cold: cold ?? this.cold,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      sensorBackground: sensorBackground ?? this.sensorBackground,
      sensorBorder: sensorBorder ?? this.sensorBorder,
    );
  }

  @override
  ThemeExtension<TemperatureColors> lerp(
    ThemeExtension<TemperatureColors>? other,
    double t,
  ) {
    if (other is! TemperatureColors) {
      return this;
    }
    return TemperatureColors(
      hot: Color.lerp(hot, other.hot, t),
      cold: Color.lerp(cold, other.cold, t),
      warning: Color.lerp(warning, other.warning, t),
      success: Color.lerp(success, other.success, t),
      sensorBackground: Color.lerp(sensorBackground, other.sensorBackground, t),
      sensorBorder: Color.lerp(sensorBorder, other.sensorBorder, t),
    );
  }
}
