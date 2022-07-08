import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class CandleChart extends StatefulWidget {
  const CandleChart({Key? key}) : super(key: key);

  @override
  State<CandleChart> createState() => _CandleChartState();
}

class _CandleChartState extends State<CandleChart> {
  late List<ChartSampleData> _chartData;
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: const Text("Candle Chart"),centerTitle: true,
          // ),
          body: SfCartesianChart(
            title: ChartTitle(text: 'Candle Chart'),
            legend: Legend(isVisible: true,position: LegendPosition.bottom),
            trackballBehavior: _trackballBehavior,
              series: <CandleSeries>[
                CandleSeries<ChartSampleData,DateTime>(
                  name: "title",
                    dataSource: _chartData,
                    xValueMapper: (ChartSampleData sales,_) => sales.x,
                    lowValueMapper:  (ChartSampleData sales,_) => sales.low,
                    highValueMapper:  (ChartSampleData sales,_) => sales.high,
                    openValueMapper:  (ChartSampleData sales,_) => sales.open,
                    closeValueMapper:  (ChartSampleData sales,_) => sales.close
                )
             ],
            primaryXAxis: DateTimeAxis(
                dateFormat: DateFormat.MMM(),
                majorGridLines: const MajorGridLines(width: 0)
            ),
            primaryYAxis: NumericAxis(
                minimum: 70,
                maximum: 130,
                interval: 10,
                numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),

          ),
        )
    );
  }
  List<ChartSampleData> getChartData() {
    return <ChartSampleData>[
       ChartSampleData(
          x: DateTime(2016, 01, 11),
          open: 98.97,
          high: 101.19,
          low: 95.36,
          close: 97.13),
      ChartSampleData(
          x: DateTime(2016, 01, 18),
          open: 98.41,
          high: 101.46,
          low: 93.42,
          close: 101.42),
      ChartSampleData(
          x: DateTime(2016, 01, 25),
          open: 101.52,
          high: 101.53,
          low: 92.39,
          close: 97.34),
      ChartSampleData(
          x: DateTime(2016, 02, 01),
          open: 96.47,
          high: 97.33,
          low: 93.69,
          close: 94.02),
      ChartSampleData(
          x: DateTime(2016, 02, 08),
          open: 93.13,
          high: 96.35,
          low: 92.59,
          close: 93.99),
      ChartSampleData(
          x: DateTime(2016, 02, 15),
          open: 91.02,
          high: 94.89,
          low: 90.61,
          close: 92.04),
      ChartSampleData(
          x: DateTime(2016, 02, 22),
          open: 96.31,
          high: 98.0237,
          low: 98.0237,
          close: 96.31),
      ChartSampleData(
          x: DateTime(2016, 02, 29),
          open: 99.86,
          high: 106.75,
          low: 99.65,
          close: 106.01),
      ChartSampleData(
          x: DateTime(2016, 03, 07),
          open: 102.39,
          high: 102.83,
          low: 100.15,
          close: 102.26),
      ChartSampleData(
          x: DateTime(2016, 03, 14),
          open: 101.91,
          high: 106.5,
          low: 101.78,
          close: 105.92),
      ChartSampleData(
          x: DateTime(2016, 03, 21),
          open: 105.93,
          high: 107.65,
          low: 104.89,
          close: 105.67),
      ChartSampleData(
          x: DateTime(2016, 03, 28),
          open: 106,
          high: 110.42,
          low: 104.88,
          close: 109.99),
      ChartSampleData(
          x: DateTime(2016, 04, 04),
          open: 110.42,
          high: 112.19,
          low: 108.121,
          close: 108.66),
      ChartSampleData(
          x: DateTime(2016, 04, 11),
          open: 108.97,
          high: 112.39,
          low: 108.66,
          close: 109.85),
      ChartSampleData(
          x: DateTime(2016, 04, 18),
          open: 108.89,
          high: 108.95,
          low: 104.62,
          close: 105.68),
      ChartSampleData(
          x: DateTime(2016, 04, 25),
          open: 105,
          high: 105.65,
          low: 92.51,
          close: 93.74),
      ChartSampleData(
          x: DateTime(2016, 05, 02),
          open: 93.965,
          high: 95.9,
          low: 91.85,
          close: 92.72),
      ChartSampleData(
          x: DateTime(2016, 05, 09),
          open: 93,
          high: 93.77,
          low: 89.47,
          close: 90.52),
      ChartSampleData(
          x: DateTime(2016, 05, 16),
          open: 92.39,
          high: 95.43,
          low: 91.65,
          close: 95.22),
      ChartSampleData(
          x: DateTime(2016, 05, 23),
          open: 95.87,
          high: 100.73,
          low: 95.67,
          close: 100.35),
    ];
  }
}

class ChartSampleData{
  ChartSampleData({
    this.x,
    this.open,
    this.close,
    this.low,
    this.high,
  });
  final DateTime? x;
  final num? open;
  final num? close;
  final num? low;
  final num? high;

}
