import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncgagues/screens/spline_chart.dart';

class SplineAreaChar extends StatefulWidget {
  const SplineAreaChar({Key? key}) : super(key: key);

  @override
  State<SplineAreaChar> createState() => _SplineAreaCharState();
}

class _SplineAreaCharState extends State<SplineAreaChar> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData(2010, 10.53, 3.3,2.2),
      ChartData(2011, 9.5, 5.4,3.4),
      ChartData(2012, 10, 2.65,1.65),
      ChartData(2013, 9.4, 2.62,1.62),
      ChartData(2014, 5.8, 1.99,0.94),
      ChartData(2015, 4.9, 1.44,0.44),
      ChartData(2016, 4.5, 2,1),
      ChartData(2017, 3.6, 1.56,0.56),
      ChartData(2018, 3.43, 2.1,0.01),
    ];
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Spline Area Chart"),),
      body: Center(
        child: Container(
          child: SfCartesianChart(
            series: <ChartSeries>[
              SplineAreaSeries<ChartData,int>(
                  dataSource: chartData,
                 dashArray: <double>[5, 5,5],
                  xValueMapper: (ChartData data,_) => data.x,
                  yValueMapper: (ChartData data,_) => data.y,
                  //dataLabelSettings: const DataLabelSettings(isVisible: true)
              ),
              SplineAreaSeries<ChartData,int>(
                  dataSource: chartData,

                  xValueMapper: (ChartData data,_) => data.x,
                  yValueMapper: (ChartData data,_) => data.y1
              ),
              SplineAreaSeries<ChartData,int>(
                  dataSource: chartData,
                  splineType: SplineType.cardinal,
                  xValueMapper: (ChartData data,_) => data.x,
                  yValueMapper: (ChartData data,_) => data.y2
              ),
            ]
          ),
        ),
      ),
    );
  }
}
class ChartData {
  ChartData(this.x, this.y, this.y1,this.y2);
  final int x;
  final double y;
  final double y1;
  final double y2;
}