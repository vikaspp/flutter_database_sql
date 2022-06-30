import 'package:flutter/material.dart';
import 'package:google_maps_in_flutter/view/current_location.dart';
import 'package:google_maps_in_flutter/view/map_screen.dart';
import 'home_page.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
