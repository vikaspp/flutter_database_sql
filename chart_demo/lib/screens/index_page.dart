import 'package:chart_demo/screens/candle_chart.dart';
import 'package:chart_demo/screens/pie_chart.dart';
import 'package:chart_demo/screens/pie_chart1.dart';
import 'package:chart_demo/screens/pie_chart2.dart';
import 'package:flutter/material.dart';
class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);
  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chart Demo"),centerTitle: true,
      ),
      body: Center(
        child: Column(
           children: [
             Container(
               child: ElevatedButton(
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const PieChart()));
                 },
                 child: Text("  Pie Chart  "),
               ),
             ),
             Container(
               child: ElevatedButton(
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const PieChart1()));
                 },
                 child: Text("DoughnutSeries"),
               ),
             ),

             Container(
               child: ElevatedButton(
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const PieChart2()));
                 },
                 child: Text("Radial Bar"),
               ),
             ),
             Container(
               child: ElevatedButton(
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const CandleChart()));
                 },
                 child: Text("DoughnutSeries"),
               ),
             )
           ],
        ),
      ),
    );
  }
}
