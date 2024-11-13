import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradColors = [
    const Color(0Xff23b6e6),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          LineChart(
            LineChartData(
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: 6,
              lineBarsData: List.generate(gradColors.length, (index) {
                final color = gradColors[index];
                return LineChartBarData(
                  spots: [
                    FlSpot(0, 3),
                    FlSpot(1, 5),
                    FlSpot(2, 1.5),
                    FlSpot(4, 7),
                  ],
                  isCurved: true,
                  color: color,
                  barWidth: 5,
                  belowBarData: BarAreaData(
                    show: true,
                    color: color.withOpacity(0.3),
                  ),
                );
              }),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Text(
                "Spending Report (Year)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
