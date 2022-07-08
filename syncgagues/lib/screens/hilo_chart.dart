import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HiloChart extends StatefulWidget {
  const HiloChart({Key? key}) : super(key: key);

  @override
  State<HiloChart> createState() => _HiloChartState();
}

class _HiloChartState extends State<HiloChart> {

  late List<ChartData> _chartData;
  @override
  void initState() {
    // TODO: implement initState
    _chartData = getChartData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: const Text("Range Column Chart"),),
      body: Center(
        child: SfCartesianChart(
          primaryXAxis: DateTimeAxis(),
            series: <ChartSeries>[
              RangeColumnSeries<ChartData, DateTime>(
                dataSource: _chartData,
                xValueMapper: (ChartData data, _) => data.x,
                lowValueMapper: (ChartData data, _) => data.low,
                highValueMapper: (ChartData data, _) => data.high,
              )
            ]
        ),
      ),
    );
  }
  List<ChartData> getChartData(){
    return <ChartData>[
      ChartData(DateTime(2015,1,1), 3,9),
      ChartData(DateTime(2016,2,1), 4,11),
      ChartData(DateTime(2017,3,1), 5,13),
      ChartData(DateTime(2018,4,1), 6,16),
    ];
  }
}
class ChartData {
  ChartData(this.x, this.high, this.low);
  final DateTime x;
  final double high;
  final double low;
}