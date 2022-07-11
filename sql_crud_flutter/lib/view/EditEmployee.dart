import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sql_crud_flutter/models/employee.dart';

import '../services/UserService.dart';

class EditEmployee extends StatefulWidget {
  final Employee employee;

  const EditEmployee({Key? key, required this.employee}) : super(key: key);

  @override
  State<EditEmployee> createState() => _EditEmployeeState();
}

class _EditEmployeeState extends State<EditEmployee> {
  late List<Employee> _userList = <Employee>[];
  PickedFile? _imageFile;
  var _name = TextEditingController();
  var _lastName = TextEditingController();
  var _email = TextEditingController();
  var _desi = TextEditingController();
  var _dob = TextEditingController();
  var _img = "";
  var _salary = TextEditingController();

  bool _validateName = false;
  bool _validatelastName = false;
  bool _validateEmail = false;
  bool _validateDesi = false;
  bool _validateDob = false;
  bool _validateImg = false;
  bool _validateSalary = false;
  var _userService = UserService();

  @override
  void initState() {
    log("----------employee-------->> ${widget.employee.toString()}");

    setState(() {
      _name.text = widget.employee.name ?? '';
      _lastName.text = widget.employee.lastName ?? '';
      _email.text = widget.employee.email ?? '';
      _desi.text = widget.employee.desi ?? '';
      _dob.text = widget.employee.dob ?? '';
      _salary.text = widget.employee.salary ?? '';
      _img = widget.employee.img ?? '';
    });
    super.initState();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: const Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Update Employee"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    _showChoiceDialog(context);
                  },
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
              ),
              // Center(
              //   child: const Text(
              //     'Edit Employee',
              //     style: TextStyle(
              //         fontSize: 20,
              //         color: Colors.teal,
              //         fontWeight: FontWeight.w500),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20.0,
              // ),
              // Center(
              //   child: Image.file(ile(
              //     File(_userList[index].img!),
              //     fit: BoxFit.cover,
              //     height: 50,
              //     width: 50,
              //   )),
              // ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Name',
                    labelText: 'Name',
                    errorText:
                        _validateName ? 'Name Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _lastName,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Last Name',
                    labelText: 'Name',
                    errorText: _validatelastName
                        ? 'Contact Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Email',
                    labelText: 'Email',
                    errorText: _validateEmail
                        ? 'Description Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _desi,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Designation',
                    labelText: 'Designation',
                    errorText: _validateDesi
                        ? 'Description Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _dob,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter DOB',
                    labelText: 'DOB',
                    errorText: _validateDob
                        ? 'Description Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _salary,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Salary',
                    labelText: 'Salary',
                    errorText: _validateSalary
                        ? 'Description Value Can\'t Be Empty'
                        : null,
                  )),
              // const SizedBox(
              //   height: 20.0,
              // ),
              // TextField(
              //     controller: _img,
              //     decoration: InputDecoration(
              //       border: const OutlineInputBorder(),
              //       hintText: 'Enter Image',
              //       labelText: 'Image',
              //       errorText: _validateImg
              //           ? 'Description Value Can\'t Be Empty'
              //           : null,
              //     )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blue,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _name.text.isEmpty
                              ? _validateName = true
                              : _validateName = false;
                          _lastName.text.isEmpty
                              ? _validatelastName = true
                              : _validatelastName = false;
                          _email.text.isEmpty
                              ? _validateEmail = true
                              : _validateEmail = false;
                          _desi.text.isEmpty
                              ? _validateDesi = true
                              : _validateDesi = false;
                          _dob.text.isEmpty
                              ? _validateDob = true
                              : _validateDob = false;
                          _salary.text.isEmpty
                              ? _validateSalary = true
                              : _validateSalary = false;
                          _img.isEmpty
                              ? _validateImg = true
                              : _validateImg = false;
                        });
                        if (_validateName == false &&
                            _validatelastName == false &&
                            _validateEmail == false &&
                            _validateDesi == false &&
                            _validateDob == false &&
                            _validateSalary == false) {
                          // print("Good Data Can Save");
                          var _employee = Employee();
                          _employee.id = widget.employee.id;
                          _employee.name = _name.text;
                          _employee.lastName = _lastName.text;
                          _employee.email = _email.text;
                          _employee.desi = _desi.text;
                          _employee.dob = _dob.text;
                          _employee.salary = _salary.text;
                          _employee.img = _img;
                          var result =
                              await _userService.EditEmployee(_employee);
                          Navigator.pop(context, result);
                        }
                      },
                      child: const Text('Update Employee')),
                  // const SizedBox(
                  //   width: 10.0,
                  // ),
                  // TextButton(
                  //     style: TextButton.styleFrom(
                  //         primary: Colors.white,
                  //         backgroundColor: Colors.red,
                  //         textStyle: const TextStyle(fontSize: 15)),
                  //     onPressed: () {
                  //       _name.text = '';
                  //       _lastName.text = '';
                  //       _email.text = '';
                  //       _desi.text = '';
                  //       _dob.text = '';
                  //       _salary.text = '';
                  //       _img.text = '';
                  //     },
                  //     child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _openGallery(BuildContext context) async {
    final image = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _imageFile = image!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final image = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      _imageFile = image!;
    });
    Navigator.pop(context);
  }
}
