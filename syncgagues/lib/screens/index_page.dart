import 'package:flutter/material.dart';
import 'package:syncgagues/screens/area_chart.dart';
import 'package:syncgagues/screens/bar_chart.dart';
import 'package:syncgagues/screens/column_chart.dart';
import 'package:syncgagues/screens/fast_line_chart.dart';
import 'package:syncgagues/screens/hilo_chart.dart';
import 'package:syncgagues/screens/home_page.dart';
import 'package:syncgagues/screens/sfcertesian_chart.dart';
import 'package:syncgagues/screens/spline_area_chart.dart';
import 'package:syncgagues/screens/spline_chart.dart';
import 'package:syncgagues/screens/stacked_column_chart.dart';
class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: const Text("Syncfusion Flutter Charts",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),),
    body: Container(
      child: Wrap(
          spacing: 20.0,
        runSpacing: 4.0,
        children: <Widget>[
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePages()),
            );
          },

              child: const Text("Line Chart")
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FastLineChart()),
            );
          },

             child: const Text("Fast Line Chart")
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ColumnChart()),
            );
          },

              child: const Text("Column Chart")
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AreaChart()),
            );
          },

              child: const Text("Area Chart")
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SplineChart()),
            );
          },

              child: const Text("Spline Chart")
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BarChart()),
            );
          },

              child: const Text("Bar Chart")
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SplineAreaChar()),
            );
          },

              child: const Text("Spline Area Chart")
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StackedColumnChart()),
            );
          },

              child: const Text("StackedColumn Chart")
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HiloChart()),
            );
          },

              child: const Text("RangeColumnChart")
          ),

        ],
      ),
    ),
    );

  }
}
