import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:xpense_app/screens/statistics/screen_statistics.dart';

class ChartWidget extends StatefulWidget {
  Map entiredata;
  final double height;
  List<FlSpot> dataset = [];
  DateTime today = DateTime.now();
  ChartWidget({Key? key, required this.entiredata, required this.height})
      : super(key: key);

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  final List<Color> gradientColorstwo = [
    const Color.fromARGB(255, 230, 35, 35),
    const Color.fromARGB(255, 211, 2, 2),
  ];
  @override
  Widget build(BuildContext context) {
    if (widget.entiredata.length < 2) {
      return const Text('Not enough data');
    } else {
      return Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 36, 5, 46),
              borderRadius: BorderRadius.circular(20)),
          height: widget.height,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: LineChart(
              LineChartData(
                  titlesData: FlTitlesData(
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border:
                        Border.all(color: const Color(0xff37434d), width: 1),
                  ),
                  gridData: FlGridData(
                    show: true,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: const Color(0xff37434d),
                        strokeWidth: 1,
                      );
                    },
                    drawVerticalLine: true,
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: const Color(0xff37434d),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  lineBarsData: [
                    // LineChartBarData(
                    //     isCurved: true,
                    //     gradient: LinearGradient(colors: gradientColors),
                    //     spots: getPlotPoints(widget.entiredata),
                    //     barWidth: 5),
                    LineChartBarData(
                        isCurved: true,
                        belowBarData: BarAreaData(
                            show: true,
                            color: page
                                ? const Color.fromARGB(97, 244, 67, 54)
                                : const Color.fromARGB(91, 76, 175, 79)),
                        gradient: page
                            ? LinearGradient(colors: gradientColorstwo)
                            : LinearGradient(colors: gradientColors),
                        spots: page
                            ? getPlotPointsExpense(widget.entiredata)
                            : getPlotPoints(widget.entiredata),
                        barWidth: 5)
                  ]),
            ),
          ));
    }
  }

  List<FlSpot> getPlotPoints(Map entireData) {
    ChartWidget chart = ChartWidget(
      entiredata: widget.entiredata,
      height: 300,
    );
    chart.dataset = [];
    entireData.forEach((key, value) {
      if ((value["type"] == "Income") &&
          (value["date"] as DateTime).month == chart.today.month) {
        chart.dataset.add(FlSpot((value["date"] as DateTime).day.toDouble(),
            (value["amount"] as int).toDouble()));
      }
    });

    return chart.dataset;
  }

  List<FlSpot> getPlotPointsExpense(Map entireData) {
    ChartWidget chart = ChartWidget(
      entiredata: widget.entiredata,
      height: 300,
    );
    chart.dataset = [];
    entireData.forEach((key, value) {
      if ((value["type"] == "Expense") &&
          (value["date"] as DateTime).month == chart.today.month) {
        chart.dataset.add(FlSpot((value["date"] as DateTime).day.toDouble(),
            (value["amount"] as int).toDouble()));
      }
    });

    return chart.dataset;
  }
}
