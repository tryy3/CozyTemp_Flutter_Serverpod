import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_server_client/flutter_server_client.dart';
import 'package:intl/intl.dart';

/// A widget that displays a temperature chart for a single sensor
class TemperatureChart extends StatelessWidget {
  /// The sensor to display the chart for
  final Sensor sensor;

  /// The time range being displayed (for formatting purposes)
  final String timeRange;

  const TemperatureChart({
    super.key,
    required this.sensor,
    required this.timeRange,
  });

  @override
  Widget build(BuildContext context) {
    final rawData = sensor.rawDataList ?? [];

    if (rawData.isEmpty) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                sensor.name ?? sensor.identifier,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'No temperature data available',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    // Convert raw data to chart spots
    final spots = <FlSpot>[];
    double minTemp = double.infinity;
    double maxTemp = double.negativeInfinity;

    for (int i = 0; i < rawData.length; i++) {
      final data = rawData[i];
      final timestamp = data.createdAt.millisecondsSinceEpoch.toDouble();
      final temp = data.temperature;

      spots.add(FlSpot(timestamp, temp));

      if (temp < minTemp) minTemp = temp;
      if (temp > maxTemp) maxTemp = temp;
    }

    // Add some padding to the min/max range
    final tempRange = maxTemp - minTemp;
    final padding = tempRange * 0.1;
    minTemp = minTemp - padding;
    maxTemp = maxTemp + padding;

    // Ensure we have at least a 5 degree range
    if (maxTemp - minTemp < 5) {
      final center = (maxTemp + minTemp) / 2;
      minTemp = center - 2.5;
      maxTemp = center + 2.5;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sensor.name ?? sensor.identifier,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (sensor.description != null) ...[
              const SizedBox(height: 4),
              Text(
                sensor.description!,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  minY: minTemp,
                  maxY: maxTemp,
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 2,
                      dotData: FlDotData(
                        show: spots.length <=
                            50, // Only show dots if not too many points
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.blue.withOpacity(0.1),
                      ),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '${value.toStringAsFixed(1)}°C',
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          final date = DateTime.fromMillisecondsSinceEpoch(
                              value.toInt());

                          // Format based on time range
                          String format;
                          if (timeRange == '24h') {
                            format = 'HH:mm';
                          } else if (timeRange == '7d') {
                            format = 'MM/dd';
                          } else {
                            format = 'MM/dd';
                          }

                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              DateFormat(format).format(date),
                              style: const TextStyle(fontSize: 10),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: (maxTemp - minTemp) / 5,
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((spot) {
                          final date = DateTime.fromMillisecondsSinceEpoch(
                              spot.x.toInt());
                          final temp = spot.y.toStringAsFixed(1);
                          return LineTooltipItem(
                            '${DateFormat('MMM dd, HH:mm').format(date)}\n$temp°C',
                            const TextStyle(color: Colors.white),
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
