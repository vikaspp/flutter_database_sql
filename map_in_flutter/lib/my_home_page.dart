import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {

  final Completer<GoogleMapController> _controller = Completer();
  //GoogleMapController? _controller;
//  final LatLng _center = const LatLng(22.9937067, 72.501555);

   final List<Marker> _markers =  <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(28.604800, 77.216721),
        infoWindow: InfoWindow(
          title: 'marker tiote'
        ),

    ),
    const Marker(
      markerId: MarkerId('3'),
      position: LatLng(28.641800, 77.216721),
      infoWindow: const InfoWindow(
          title: 'marker tiote'
      ),

    ),
    const Marker(
      markerId: MarkerId('4'),
      position: LatLng(28.642800, 77.216721),
      infoWindow: InfoWindow(
          title: 'marker tiote'
      ),

    ),
  ];

  static  CameraPosition _initPostion = const CameraPosition(
      target: const LatLng(22.9937067, 72.501555),
      zoom: 9,
  );

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace)async{
      await Geolocator.requestPermission();
      print("Error"+error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }
  // @override
  // void initState() {
  //  // _markers = [1, 2,3];
  //   // _markers.addAll(_markers);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title:  const Text('GoogleMap'),
          backgroundColor: Colors.lightBlue,
        ),
        body: GoogleMap(
          //zoomControlsEnabled: false,
          //zoomControlsEnabled: false,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(_markers),

         initialCameraPosition: _initPostion,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          getUserCurrentLocation().then((value)async{
            print("My current location");
            print(value.latitude.toString() +" "+ value.longitude.toString());
            _markers.add(
              Marker(
                  markerId: const MarkerId('2'),
                  position: LatLng(value.latitude,value.longitude),
                  infoWindow: const InfoWindow(
                    title: 'My Current Location'
                  )
              )
            );

            CameraPosition cameraPosition1 = CameraPosition(
                zoom: 9,
                target: LatLng(value.latitude,value.longitude)
            );
            final GoogleMapController controller1 = await _controller.future;
            controller1.animateCamera(CameraUpdate.newCameraPosition(cameraPosition1));
           // controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

            setState((){

            });
          });
        },
        //elevation: 10,

        child:  const Icon(Icons.my_location),
      ),
      );

  }
}

