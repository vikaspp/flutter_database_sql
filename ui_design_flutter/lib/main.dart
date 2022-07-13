import 'package:flutter/material.dart';
import 'package:ui_design_flutter/ui/IndexPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       // primarySwatch:  Color(0xFF1E1D33),
        backgroundColor: Color(0xFF1E1D33)
      ),
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}
