import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncgagues/screens/spline_chart.dart';

class StackedColumnChart extends StatefulWidget {
  const StackedColumnChart({Key? key}) : super(key: key);

  @override
  State<StackedColumnChart> createState() => _StackedColumnChartState();
}

class _StackedColumnChartState extends State<StackedColumnChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('China', 12, 10, 14, 20),
      ChartData('USA', 14, 11, 18, 23),
      ChartData('UK', 16, 10, 15, 20),
      ChartData('Brazil', 18, 16, 18, 24)
    ];
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Stacked Column Chart"),
      ),
      body: Center(
        child: Container(
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[
                StackedColumnSeries<ChartData, String>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y1
                ),
                StackedColumnSeries<ChartData, String>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y2
                ),
                StackedColumnSeries<ChartData,String>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y3
                ),
                StackedColumnSeries<ChartData, String>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y4
                )
              ]
          )
        ),
      ),
    );
  }
}
class ChartData{
  ChartData(this.x, this.y1, this.y2, this.y3, this.y4);
  final String x;
  final double y1;
  final double y2;
  final double y3;
  final double y4;
}