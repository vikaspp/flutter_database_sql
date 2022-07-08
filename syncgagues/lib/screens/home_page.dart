import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speedometer"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SfRadialGauge(
                // title: GaugeTitle(text: 'Speedometer' , textStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,maximum: 150,interval: 10,pointers: const <GaugePointer>[NeedlePointer(value:90),],
                    annotations:<GaugeAnnotation> [
                      GaugeAnnotation(
                          widget: Container(
                            child: const Text('90.0',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
                          ),angle: 90,positionFactor: 0.5,
                      )

                    ]
                    ,ranges: [
                    GaugeRange(
                      startValue: 0,
                      endValue: 50,
                      color: Colors.green,
                      startWidth: 10,
                      endWidth: 10,
                    ),
                    GaugeRange(
                      startValue: 50,
                      endValue: 100,
                      color: Colors.orange,
                      startWidth: 10,
                      endWidth: 10,
                    ),
                    GaugeRange(
                      startValue: 100,
                      endValue: 150,
                      color: Colors.red,
                      startWidth: 10,
                      endWidth: 10,
                    ),

                  ],
                  )

                ],

              )
            ],


        ),
      ),
    );
  }
}
