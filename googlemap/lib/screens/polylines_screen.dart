import 'dart:async';
import 'dart:collection';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:custom_marker/marker_icon.dart';


class PolyLinesScreen extends StatefulWidget {
  const PolyLinesScreen({Key? key}) : super(key: key);

  @override
  State<PolyLinesScreen> createState() => _PolyLinesScreenState();
}

class _PolyLinesScreenState extends State<PolyLinesScreen> {

  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  final Completer<GoogleMapController> _controller = Completer();

  String mapTheme = '';
  final List<Marker> _marker = <Marker>[];
  final List<LatLng> _latlang = [
    const LatLng(24.0225, 74.5714),const LatLng(23.0225, 75.5714),const LatLng(25.0225, 75.5714),
    const LatLng(26.0225, 76.5714),const LatLng(27.0225, 77.5714),const LatLng(28.0225, 70.5714),
  ];

  final Set<Marker> _marker1 = {};
  Set<Polygon> _polygon = HashSet<Polygon>();
  
  List<LatLng> points =[
    LatLng(24.0225, 74.5714),
    LatLng(28.0225, 70.5714),

  ];


  @override
  void initState(){
    super.initState();
    loadDate();
    _polygon.add(
      Polygon(polygonId: PolygonId('1'),points: points
        ,fillColor: Colors.redAccent,
        geodesic: true,
        strokeWidth: 4,
        strokeColor: Colors.lightBlue,
      )

    );
    // DefaultAssetBundle.of(context).loadString('assets/maptheme/night_theme.json').then((value){
    //     mapTheme = value;
    // });
  }
  final List<Marker> _markers1 =  <Marker>[
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
  loadDate(){
    for(int i= 0;i< _latlang.length ; i++){
      if(i%2 == 0){
        _marker.add(Marker(markerId: MarkerId(i.toString()),
            icon: BitmapDescriptor.defaultMarker,
            position: _latlang[i],
            onTap: (){
              _customInfoWindowController.addInfoWindow!(
                  Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('https://picsum.photos/250?image=9'),
                              fit: BoxFit.fitWidth,
                              filterQuality: FilterQuality.high,),
                            borderRadius:BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Colors.red,
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Title Of Place",
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: 2.5,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 4,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Text(
                            "This is description of Place This is description of PlaceThis is description of PlaceThis is description of PlaceThis is description of Place",
                            maxLines: 2,
                          ),
                        ),
                      ],

                    ),
                  ),
                  _latlang[i]
              );
            }
        )
        );
      }else{
        _marker.add(Marker(markerId: MarkerId(i.toString()),
            icon: BitmapDescriptor.defaultMarker,
            position: _latlang[i],
            onTap: (){
              _customInfoWindowController.addInfoWindow!(
                  Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                              fit: BoxFit.fitWidth,
                              filterQuality: FilterQuality.high,),
                            borderRadius:BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            color: Colors.red,
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 80,
                                child: Text(
                                  "Title Of Place",
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RatingBar.builder(
                                    initialRating: 2,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 4,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.00),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                          child: Text(
                            "This is description of Place This is description of PlaceThis is description of PlaceThis is description of PlaceThis is description of Place",
                            maxLines: 2,
                          ),
                        ),
                      ],

                    ),
                  ),
                  _latlang[i]
              );
            }
        )
        );
      }



      setState((){
      });
    }
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace)async{
      await Geolocator.requestPermission();
      print("Error"+error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Google Map"),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) =>[
                PopupMenuItem(
                  onTap: (){
                    _controller.future.then((value){
                      DefaultAssetBundle.of(context).loadString('assets/maptheme/silver_theme.json').then((string){
                        value.setMapStyle(string);
                      });
                    });
                  },
                  child: Text("Silver"),
                ),
                PopupMenuItem(
                  child: Text("Dark"),
                  onTap: (){
                    _controller.future.then((value){
                      DefaultAssetBundle.of(context).loadString('assets/maptheme/retro_theme.json').then((string){
                        value.setMapStyle(string);
                      });
                    });
                  },
                ),
                PopupMenuItem(
                  child: Text("Night"),
                  onTap: (){
                    _controller.future.then((value){
                      DefaultAssetBundle.of(context).loadString('assets/maptheme/night_theme.json').then((string){
                        value.setMapStyle(string);
                      });
                    });
                  },
                ),
                PopupMenuItem(
                  child: Text("Default"),
                  onTap: (){
                    _controller.future.then((value){
                      DefaultAssetBundle.of(context).loadString('assets/maptheme/default_theme.json').then((string){
                        value.setMapStyle(string);
                      });
                    });
                  },
                )
              ]
          )
        ],
      ),
      body: Stack(
        children: [
            GoogleMap(
              //zoomControlsEnabled: false,
              myLocationEnabled: true,
                polygons: _polygon,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(23.0225, 75.5714)
                      ,zoom: 10
                ),
              markers: Set<Marker>.of(_marker),
              onTap: (position){
                  _customInfoWindowController.hideInfoWindow!();
              },
              onCameraMove: (position) {
                _customInfoWindowController.onCameraMove!();
              },
              onMapCreated: (GoogleMapController controller){
                  _customInfoWindowController.googleMapController =controller;
                  _controller.complete(controller);
                  controller.setMapStyle(mapTheme);
              },
            ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 200,
            width: 300,
            offset: 35,
          ),



        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0,left: 355.0),
        child: FloatingActionButton(
          onPressed: ()async{
            getUserCurrentLocation().then((value)async{
              print("My current location");
              print(value.latitude.toString() +" "+ value.longitude.toString());
                  //
                  // Marker(
                  //     markerId:const  MarkerId('2'),
                  //    // icon: await MarkerIcon.svgAsset(assetName: assetName, context: context, size: size),
                  //     position: LatLng(value.latitude,value.longitude),
                  //
                  //     // infoWindow: const InfoWindow(
                  //     //     title: 'My Current Location'
                  //     // )
                  //
                  // );



              CameraPosition cameraPosition1 = CameraPosition(
                  zoom: 20,
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
         // materialTapTargetSize: BorderRadius.all(11),
          child:  const Icon(Icons.my_location,),

        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
