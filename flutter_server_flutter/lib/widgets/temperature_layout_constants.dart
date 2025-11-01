/// Layout constants for temperature widgets
///
/// This file contains shared sizing and spacing values to ensure
/// consistent layout across temperature node and sensor widgets.

// ignore_for_file: dangling_library_doc_comments

/// Minimum width for each node card
const double minNodeWidth = 280.0;

/// Maximum width for each node card
const double maxNodeWidth = 400.0;

/// Breakpoint width for switching sensor layout
/// Below this width: 1 sensor per row
/// At or above this width: 2 sensors per row
const double sensorBreakpoint = 300.0;

/// Padding inside the node card
const double nodeCardPadding = 16.0;

/// Horizontal spacing between sensors
const double sensorSpacing = 16.0;

/// Vertical spacing between sensor rows
const double sensorRunSpacing = 16.0;

/// Padding inside each sensor card (horizontal)
const double sensorPaddingHorizontal = 12.0;

/// Padding inside each sensor card (vertical)
const double sensorPaddingVertical = 16.0;

/// Calculate the width for a sensor based on the available width and sensors per row
///
/// [availableWidth] - The width available for sensors (node width minus padding)
/// [sensorsPerRow] - Number of sensors to fit per row (1 or 2)
double calculateSensorWidth(double availableWidth, int sensorsPerRow) {
  if (sensorsPerRow <= 1) {
    return availableWidth;
  }
  return (availableWidth - (sensorSpacing * (sensorsPerRow - 1))) /
      sensorsPerRow;
}
