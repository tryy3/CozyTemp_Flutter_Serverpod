import 'package:flutter/material.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:flutter_server_flutter/widgets/temperature_layout_constants.dart';
import 'package:flutter_server_flutter/theme/app_theme.dart';

/// A widget that displays a single temperature sensor with its current reading
class TemperatureSensor extends StatelessWidget {
  /// The sensor to display
  final Sensor sensor;

  /// Optional width for the sensor widget
  /// If not provided, the widget will expand to fill available space
  final double? width;

  const TemperatureSensor({
    super.key,
    required this.sensor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final tempColors = theme.extension<TemperatureColors>();

    // Get the latest calibrated temperature from the raw data list
    final rawDataList = sensor.rawDataList ?? [];
    final latestRawData = rawDataList.isNotEmpty ? rawDataList.last : null;

    // Only show calibrated temperature (don't fall back to raw)
    final calibratedTemp = latestRawData?.calibration?.temperature;
    final hasCalibration = calibratedTemp != null;

    final container = Container(
      width: width,
      padding: const EdgeInsets.symmetric(
        horizontal: sensorPaddingHorizontal,
        vertical: sensorPaddingVertical,
      ),
      decoration: BoxDecoration(
        color:
            tempColors?.sensorBackground ?? colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: tempColors?.sensorBorder ?? colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            sensor.name ?? sensor.identifier,
            style: textTheme.titleMedium,
          ),
          if (sensor.description != null)
            Text(
              sensor.description!,
              style: textTheme.labelSmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          const SizedBox(height: 4),
          if (hasCalibration)
            Column(
              children: [
                Text(
                  '${calibratedTemp.toStringAsFixed(1)}°C',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (latestRawData?.createdAt != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      _formatDateTime(latestRawData!.createdAt),
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
              ],
            )
          else
            Column(
              children: [
                Icon(
                  Icons.hourglass_empty,
                  size: 18,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                const SizedBox(height: 2),
                Text(
                  'No reading',
                  style: textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
        ],
      ),
    );

    // If no width is specified, allow the container to expand
    return width == null ? Flexible(child: container) : container;
  }

  /// Formats the DateTime to a readable string
  /// Shows relative time for recent readings, absolute time for older ones
  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      // For older dates, show the actual date
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
