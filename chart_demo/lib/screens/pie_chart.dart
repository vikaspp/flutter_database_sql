import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  const PieChart({Key? key}) : super(key: key);

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    // TODO: implement initState
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pia Chart"),
        ),
        body: SfCircularChart(
          title: ChartTitle(text: 'Pia Chart',),
          legend: Legend(isVisible: true,overflowMode: LegendItemOverflowMode.wrap,position: LegendPosition.bottom),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
            PieSeries<GDPData,String>(
              dataSource: _chartData,
              xValueMapper: (GDPData data,_) => data.continent,
              yValueMapper: (GDPData data,_) => data.gdp,
              dataLabelSettings: const DataLabelSettings(isVisible: true),enableTooltip: true
            )
          ],
        ),
      ),
    );
  }
  List<GDPData> getChartData(){
    final List<GDPData> chartData = [
      GDPData('Asia', 34324),
      GDPData('Africa', 20000),
      GDPData('North America', 445554),
      GDPData('South America', 22222),
      GDPData('Europe', 56343),
      GDPData('Australia', 56757),
    ];
    return chartData;
  }
}

//=========================================================================================================

class GDPData{
  GDPData(this.continent,this.gdp);
  final String continent;
  final int gdp;

}