import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class MyHomePages extends StatefulWidget {
  const MyHomePages({Key? key}) : super(key: key);

  @override
  State<MyHomePages> createState() => _MyHomePagesState();
}

class _MyHomePagesState extends State<MyHomePages> {

  late List<SalesData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Line Chart"),
            centerTitle: true,
          ),
          body: SfCartesianChart(
            title: ChartTitle(text: 'Sales Analysis'),
             legend: Legend(isVisible: true,position: LegendPosition.bottom),
             tooltipBehavior: _tooltipBehavior,
              series: <ChartSeries>[

             LineSeries<SalesData,double>( name : "Sales",dataSource: _chartData,
                 xValueMapper: (SalesData sales, _) => sales.year,
                 yValueMapper:(SalesData sales, _) => sales.sales,
               dataLabelSettings: const DataLabelSettings(isVisible: true),enableTooltip: true,
               color: Colors.cyanAccent,

             )
          ],
            primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
            primaryYAxis: NumericAxis(
              labelFormat: '{value}M',
                numberFormat: NumberFormat.simpleCurrency(name: '₹')),

          ),
        ),

    );

  }
  List<SalesData> getChartData(){
    final List<SalesData> chartData = [
      SalesData(2015, 20),
      SalesData(2016, 45),
      SalesData(2017, 20),
      SalesData(2018, 50),
      SalesData(2019, 60),
    ];
    return chartData;
  }
}
class SalesData{
  SalesData(this.year,this.sales);
  final double year;
  final double sales;
}