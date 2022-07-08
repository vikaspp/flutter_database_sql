import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class SplineChart extends StatefulWidget {
  const SplineChart({Key? key}) : super(key: key);

  @override
  State<SplineChart> createState() => _SplineChartState();
}

class _SplineChartState extends State<SplineChart> {

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData('Jan', 21),
      ChartData('Feb', 24),
      ChartData('Mar', 35),
      ChartData('Apr', 38),
      ChartData('May', 54),
      ChartData('Jun', 21),
      ChartData('Jul', 24),
      ChartData('Aug', 35),
      ChartData('Sep', 38),
      ChartData('Oct', 54),
      ChartData('Nov', 38),
      ChartData('Dec', 54)
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text("Spline Chart"),
          centerTitle: true,
        ),
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    isTransposed: true,
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries>[
                      SplineSeries<ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y
                      )
                    ]
                )
            )
        )
    );
  }
}
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
