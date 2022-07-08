import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(view_employee());

class view_employee extends StatelessWidget {
  final SystemUiOverlayStyle _style =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(_style);
    return MaterialApp(
      home: view_employeeStatefulWidget(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class view_employeeStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _view_employeeState();
  }
}

class _view_employeeState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("view_employee"),
      ),
      body: Center(
        child: Text("view_employee"),
      ),
    );
  }
}
