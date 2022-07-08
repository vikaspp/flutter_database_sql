import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatefulWidget {
  const BarChart({Key? key}) : super(key: key);

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, 35),
      ChartData(2, 23),
      ChartData(3, 34),
      ChartData(4, 25),
      ChartData(5, 40),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bar Chart"),
      ),
      body: Center(
        child: Container(
          child: SfCartesianChart(
            series: <ChartSeries>[
             BarSeries<ChartData,int>(dataSource: chartData,
                 xValueMapper: (ChartData data, _) => data.x,
                 yValueMapper: (ChartData data,_) => data.y
             )
            ],
          ),
        ),
      ),
    );
  }
}
class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;

}