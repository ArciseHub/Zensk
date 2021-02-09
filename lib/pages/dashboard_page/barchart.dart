import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:informatik_projekt/utilities/colors/colors.dart';

class DividendBarChart extends StatelessWidget {
  final customColors = CustomColors();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
      child: AspectRatio(
        aspectRatio: 1.7,
        child: Card(
          elevation: 0,
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          color: const Color.fromRGBO(0, 0, 0, 0),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 20,
              barTouchData: BarTouchData(
                enabled: false,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipPadding: const EdgeInsets.all(0),
                  tooltipBottomMargin: 8,
                  getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                  ) {
                    return BarTooltipItem(
                      rod.y.round().toString(),
                      TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (value) => const TextStyle(
                      color: Color(0xff7589a2),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  margin: 20,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return '1 Week';
                      case 1:
                        return '2 Week';
                      case 2:
                        return '3 Week';
                      case 3:
                        return '4 Week';
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(showTitles: false),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(y: 8, colors: [
                      customColors.navigationBarSelectedItemColor,
                      Colors.lightBlueAccent,
                    ])
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(y: 10, colors: [
                      customColors.navigationBarSelectedItemColor,
                      Colors.lightBlueAccent,
                    ])
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(y: 14, colors: [
                      customColors.navigationBarSelectedItemColor,
                      Colors.lightBlueAccent,
                    ])
                  ],
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(y: 15, colors: [
                      customColors.navigationBarSelectedItemColor,
                      Colors.lightBlueAccent,
                    ])
                  ],
                  showingTooltipIndicators: [0],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
