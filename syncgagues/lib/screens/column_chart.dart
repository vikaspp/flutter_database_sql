import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
 class ColumnChart extends StatefulWidget {
   const ColumnChart({Key? key}) : super(key: key);

   @override
   State<ColumnChart> createState() => _ColumnChartState();
 }

 class _ColumnChartState extends State<ColumnChart> {
   @override
   Widget build(BuildContext context) {
     final List<ChartData> chartData = [
       ChartData(1, 35,2010),
       ChartData(2, 23,2011),
       ChartData(3, 34,2012),
       ChartData(4, 25,2013),
       ChartData(5, 40,2014),
     ];
     return Scaffold(
       appBar: AppBar(centerTitle: true,title: Text("Column Chart"),),
         body: Center(
             child: Container(
                 child: SfCartesianChart(
                     enableSideBySideSeriesPlacement: false,
                     series: <ChartSeries<ChartData, int>>[
                       // Renders column chart
                       ColumnSeries<ChartData, int>(
                           dataSource: chartData,
                        // isTrackVisible: true,
                           xValueMapper: (ChartData data, _) => data.x,
                           yValueMapper: (ChartData data, _) => data.y,
                          width: 0.4,
                         spacing: 0.5,
                       )
                     ]
                 )
             )
         )
     );
   }

 }
class ChartData {
  ChartData(this.x, this.y,this.y1);
  final int x;
  final double y;
  final double y1;
}