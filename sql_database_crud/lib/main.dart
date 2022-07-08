import 'package:flutter/material.dart';
import 'package:sql_database_crud/view/IndexPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}
