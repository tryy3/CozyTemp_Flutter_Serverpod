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

  // ==================== Common Theme Properties ====================
  // These properties are shared between light and dark themes.
  // Edit these values to change both themes simultaneously.

  /// Common text theme used across all themes
  /// Edit font sizes and weights here to affect both light and dark themes
  static const TextTheme _textTheme = TextTheme(
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
  );

  // Common border radius values
  static const double _cardBorderRadius = 12;
  static const double _buttonBorderRadius = 8;
  static const double _dialogBorderRadius = 16;
  static const double _inputBorderRadius = 8;
  static const double _fabBorderRadius = 16;

  // Common elevation values
  static const double _cardElevation = 2;
  static const double _buttonElevation = 2;
  static const double _dialogElevation = 8;
  static const double _fabElevation = 4;
  static const double _appBarElevation = 0;

  // Common padding values
  static const EdgeInsets _buttonPadding =
      EdgeInsets.symmetric(horizontal: 24, vertical: 12);
  static const EdgeInsets _textButtonPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const EdgeInsets _inputContentPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 12);

  // ==================== Theme Builders ====================

  /// Build card theme with theme-specific colors
  static CardThemeData _buildCardTheme(Brightness brightness) {
    return CardThemeData(
      elevation: _cardElevation,
      shadowColor: Colors.black.withValues(
        alpha: brightness == Brightness.light ? 0.15 : 0.3,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_cardBorderRadius),
      ),
    );
  }

  /// Build app bar theme with color scheme
  static AppBarTheme _buildAppBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      centerTitle: false,
      elevation: _appBarElevation,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
    );
  }

  /// Build elevated button theme
  static ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: _buttonElevation,
        padding: _buttonPadding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_buttonBorderRadius),
        ),
      ),
    );
  }

  /// Build text button theme
  static TextButtonThemeData _buildTextButtonTheme() {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: _textButtonPadding,
      ),
    );
  }

  /// Build dialog theme
  static DialogThemeData _buildDialogTheme() {
    return DialogThemeData(
      elevation: _dialogElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_dialogBorderRadius),
      ),
    );
  }

  /// Build input decoration theme
  static InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_inputBorderRadius),
      ),
      filled: true,
      contentPadding: _inputContentPadding,
    );
  }

  /// Build floating action button theme
  static FloatingActionButtonThemeData _buildFloatingActionButtonTheme() {
    return FloatingActionButtonThemeData(
      elevation: _fabElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_fabBorderRadius),
      ),
    );
  }

  // ==================== Theme Getters ====================

  /// Light theme configuration
  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: _textTheme,
      cardTheme: _buildCardTheme(Brightness.light),
      appBarTheme: _buildAppBarTheme(colorScheme),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      textButtonTheme: _buildTextButtonTheme(),
      dialogTheme: _buildDialogTheme(),
      inputDecorationTheme: _buildInputDecorationTheme(),
      floatingActionButtonTheme: _buildFloatingActionButtonTheme(),
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
      textTheme: _textTheme,
      cardTheme: _buildCardTheme(Brightness.dark),
      appBarTheme: _buildAppBarTheme(colorScheme),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      textButtonTheme: _buildTextButtonTheme(),
      dialogTheme: _buildDialogTheme(),
      inputDecorationTheme: _buildInputDecorationTheme(),
      floatingActionButtonTheme: _buildFloatingActionButtonTheme(),
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
