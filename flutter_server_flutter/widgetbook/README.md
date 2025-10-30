# Widgetbook Workspace

This is the Widgetbook workspace for developing and testing Flutter widgets in isolation.

## Getting Started

### 1. Install Dependencies

```bash
cd widgetbook
flutter pub get
```

### 2. Generate Widgetbook Files

Before running the widgetbook, you need to generate the necessary files using `build_runner`:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Or use watch mode for automatic regeneration during development:

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 3. Run Widgetbook

```bash
flutter run
```

Or for web:

```bash
flutter run -d chrome
```

## Adding New Use Cases

To add a new use case for a widget:

1. Create a new file in `lib/` (e.g., `my_widget.dart`)
2. Import the necessary packages:
   ```dart
   import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
   ```
3. Add a use case function with the `@widgetbook.UseCase` annotation:
   ```dart
   @widgetbook.UseCase(
     name: 'My Use Case',
     type: MyWidget,
   )
   Widget myUseCase(BuildContext context) {
     return MyWidget();
   }
   ```
4. Run `build_runner` to regenerate the widgetbook files

## Current Use Cases

### TemperatureNodesList
- **Empty List**: Shows the widget when there are no nodes
- **Single Node with Sensors**: A single node with multiple sensors
- **Multiple Nodes**: Multiple nodes with sensors across different rooms
- **Node with No Sensors**: A node that has no sensors attached
- **Sensor with No Temperature Data**: Sensors that haven't reported any data yet
- **Extreme Temperatures**: Testing very hot and cold temperature readings
- **Without Title**: Widget displayed without a title

## Features

The widgetbook includes the following addons:
- **Material Theme**: Switch between light and dark themes
- **Device Frame**: Preview on different device sizes (iPhone 13, Samsung Galaxy S20)
- **Text Scale**: Test accessibility with different text scaling factors (1.0x, 1.5x, 2.0x)

## Project Structure

```
widgetbook/
├── lib/
│   ├── main.dart                    # Widgetbook app entry point
│   ├── temperature_nodes_list.dart  # Temperature nodes use cases
│   └── main.directories.g.dart      # Generated file (do not edit)
├── pubspec.yaml
└── README.md
```

## Troubleshooting

### Build Runner Issues

If you encounter issues with the build runner:

```bash
# Clean the build cache
flutter pub run build_runner clean

# Rebuild
flutter pub run build_runner build --delete-conflicting-outputs
```

### Missing Generated Files

Make sure you've run `build_runner` at least once before running the app. The generated files are required for the app to compile.
