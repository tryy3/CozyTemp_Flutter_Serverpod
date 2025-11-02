import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Controller for managing app theme state
///
/// Handles theme mode persistence and provides methods to toggle
/// between light, dark, and system modes.
class ThemeController extends ChangeNotifier {
  static const String _themeModeKey = 'theme_mode';

  /// Current theme mode
  ThemeMode _themeMode = ThemeMode.system;

  /// SharedPreferences instance for persistence
  SharedPreferences? _prefs;

  /// Get the current theme mode
  ThemeMode get themeMode => _themeMode;

  /// Initialize the controller and load saved theme preference
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadThemeMode();
  }

  /// Load the saved theme mode from persistent storage
  Future<void> _loadThemeMode() async {
    final savedThemeIndex = _prefs?.getInt(_themeModeKey);
    if (savedThemeIndex != null &&
        savedThemeIndex >= 0 &&
        savedThemeIndex < ThemeMode.values.length) {
      _themeMode = ThemeMode.values[savedThemeIndex];
      notifyListeners();
    }
    // If no saved preference, default to ThemeMode.system (already set)
  }

  /// Set the theme mode and persist the choice
  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;

    _themeMode = mode;
    await _prefs?.setInt(_themeModeKey, mode.index);
    notifyListeners();
  }

  /// Toggle between light and dark modes
  /// If currently in system mode, switch to light
  Future<void> toggleTheme() async {
    switch (_themeMode) {
      case ThemeMode.light:
        await setThemeMode(ThemeMode.dark);
      case ThemeMode.dark:
        await setThemeMode(ThemeMode.light);
      case ThemeMode.system:
        await setThemeMode(ThemeMode.light);
    }
  }

  /// Get a human-readable name for the current theme mode
  String get themeModeLabel {
    switch (_themeMode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }

  /// Get an appropriate icon for the current theme mode
  IconData get themeModeIcon {
    switch (_themeMode) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.system:
        return Icons.brightness_auto;
    }
  }
}
