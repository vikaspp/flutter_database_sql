import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sql_crud_flutter/models/employee.dart';

class ViewEmployee extends StatefulWidget {
  final Employee employee;

  const ViewEmployee({Key? key, required this.employee}) : super(key: key);

  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {

  late List<Employee> _userList = <Employee>[];
  var _img = "";
  var _employee = Employee();

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _img = widget.employee.img ?? '';
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Employee"),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  "Full Employee Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                      fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
             Center(
               child: CircleAvatar(
                   radius: 40,
                   backgroundColor: Color(0x67CD1FFF),
                   child: _img != null
                       ? ClipRRect(
                       borderRadius: BorderRadius.circular(50),
                       child: _img != null
                           ? Image.file(File(_img))
                           : Icon(Icons.person))
                       : Container(
                     decoration: BoxDecoration(
                         color: Colors.grey[200],
                         borderRadius: BorderRadius.circular(50)),
                     width: 100,
                     height: 100,
                     child: Icon(
                       Icons.camera_alt,
                       color: Colors.grey[800],
                     ),
                   )),
             ),

              const SizedBox(
                height: 20,
              ),
              Center(

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Name             :',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(widget.employee.name ?? '', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Last Name    :',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(widget.employee.lastName ?? '', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email             :',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(widget.employee.email ?? '', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Designation  :',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(widget.employee.desi ?? '', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('DOB               :',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(widget.employee.dob ?? '', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Salary            :',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(widget.employee.salary ?? '', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

            ],
          ),
        ));
  }
}