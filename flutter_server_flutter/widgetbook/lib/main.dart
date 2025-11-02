import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:flutter_server_flutter/theme/app_theme.dart';

// Import the generated file
import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App(
  cloudAddonsConfigs: {
    'Dark Mode': [widgetbook.ThemeAddonConfig('Dark')],
    'Light Mode': [widgetbook.ThemeAddonConfig('Light')],
  },
)
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // Use the generated directories variable
      directories: directories,
      addons: [
        ViewportAddon([
          Viewports.none,
          AndroidViewports.samsungGalaxyS20,
          LinuxViewports.desktop,
        ]),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Dark', data: AppTheme.darkTheme),
            WidgetbookTheme(name: 'Light', data: AppTheme.lightTheme),
          ],
        ),
        TextScaleAddon(),
        AlignmentAddon(),
        BuilderAddon(
          name: 'Accessibility',
          builder: (context, child) => AccessibilityTools(child: child),
        ),
      ],
    );
  }
}
