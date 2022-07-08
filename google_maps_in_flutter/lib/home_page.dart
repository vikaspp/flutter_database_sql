import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //----------------------------------variables-----------------------------------------------------------
  GoogleMapController? mapController;
  //   target: LatLng(48.8561, 2.2930),
      final LatLng _center = const LatLng(23.030357, 72.517845);
      Location currentLocation = Location();
    //  Set<Marker> _markers={};
        Marker marker1 = Marker(
          markerId: const MarkerId('Marker1'),
          position: const LatLng(22.991, 72.488),
          infoWindow: const InfoWindow(title: 'LJ University'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        );
        Marker marker2 = Marker(
          markerId: const MarkerId('Marker2'),
          position: const LatLng(23.110484, 72.384598),
          infoWindow: const InfoWindow(title: 'Business Park'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        );
        Marker marker3 = Marker(
          markerId: const MarkerId('Marker3'),
          position: const LatLng(23.110484, 72.384598),
          infoWindow: InfoWindow(title: 'Peerbits'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        );
      List<Marker> list = [];
      @override
      void initState() {
        list = [marker1, marker2,marker3];
       // _markers.addAll(list);
        super.initState();
      }

  //21.7679° N
  // Longitude: 78.8718° E
  //-------------------------------functions--------------------------------------------------------------

  void getLocation() async{
    //var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc){
    mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 20.0,
      )));
       // print(loc.latitude);
       // print(loc.longitude);
      setState(() {
        list.add(Marker(markerId: const MarkerId('Marker3'),infoWindow: const InfoWindow(title: 'I am here',snippet: 'Your Location',),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
      });
    });
  }

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Google Map"),
      ),
      body: GoogleMap(
        myLocationEnabled: true,
          myLocationButtonEnabled: false,
          padding: const EdgeInsets.only(top: 100, left: 15),
        zoomControlsEnabled: false,
        onMapCreated: _onMapCreated,
          //markers: _markers,
          markers: Set<Marker>.of(list),

          initialCameraPosition: CameraPosition(
      target: _center,
      zoom: 8.0,
      )
        //  myLocationEnabled: true,

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getLocation();
        },
        //elevation: 10,

        child: const Icon(Icons.my_location),
      ),
    );
  }
}
