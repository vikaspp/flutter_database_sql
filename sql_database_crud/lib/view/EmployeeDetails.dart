import 'package:flutter/material.dart';

class EmployeeDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmployeeDetailsState();
  }
}

class _EmployeeDetailsState extends State<EmployeeDetails> {

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("EmployeeDetails"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  SizedBox(height: height*0.02,),
                  const CircleAvatar(
                    radius: 50.0,
                    backgroundImage:AssetImage(""),
                    backgroundColor: Colors.black26,
                    child: FlutterLogo(
                    size: 50),
                  ),
                  SizedBox(height: height*0.02,),
                  Text("datagsfds"),
                  SizedBox(height: height*0.02,),
                  Text("datfsdgfsa"),
                  SizedBox(height: height*0.02,),
                  Text("datfdsgdsa"),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
