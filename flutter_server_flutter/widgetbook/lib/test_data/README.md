# Test Data for Widgetbook

This directory contains pre-generated JSON data for Widgetbook use cases. The data is deterministic to ensure consistent visual regression testing in Widgetbook Cloud.

## Files

- `24h_living_room.json` - 24-hour temperature data for a living room (288 data points, 5-minute intervals)
- `7d_bedroom.json` - 7-day temperature data for a bedroom (168 data points, 1-hour intervals)
- `30d_kitchen.json` - 30-day temperature data for a kitchen (30 data points, 1-day intervals)
- `high_temp_server_room.json` - High temperature environment (45°C base)
- `low_temp_freezer.json` - Sub-zero temperatures (-18°C base)
- `stable_climate_room.json` - Minimal temperature variation (±0.2°C)
- `few_points_new_sensor.json` - Just 5 data points for testing sparse data
- `rising_trend_heating.json` - Temperature increasing from 18°C to 26°C

## Regenerating Test Data

If you need to update or regenerate the test data:

```bash
cd widgetbook
dart run tool/generate_test_data.dart
```

This will recreate all JSON files with the same deterministic data.

## Why Pre-generated Data?

Using pre-generated data instead of runtime generation ensures:
- **Consistent visual regression tests** - The same data produces identical charts every time
- **Predictable Widgetbook Cloud comparisons** - Changes to UI are detected, not data variations
- **Faster load times** - No computation needed, just load from JSON

## Adding New Test Cases

To add a new test case:

1. Add a new dataset generation function in `tool/generate_test_data.dart`
2. Run the generator script to create the JSON file
3. Add a new use case in `lib/temperature_chart.dart` that loads the JSON file using `loadTestData()`

