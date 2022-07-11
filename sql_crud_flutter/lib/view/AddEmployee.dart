import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sql_crud_flutter/models/employee.dart';
import 'package:sql_crud_flutter/services/UserService.dart';
import 'package:image_picker/image_picker.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  PickedFile? _imageFile;
  var _name = TextEditingController();
  var _lastName = TextEditingController();
  var _email = TextEditingController();
  var _desi = TextEditingController();
  var _dob = TextEditingController();
  var _img = TextEditingController();
  var _salary = TextEditingController();
  bool _validateName = false;
  bool _validatelastName = false;
  bool _validateEmail = false;
  bool _validateDesi = false;
  bool _validateDob = false;
  bool _validateImg = false;
  bool _validateSalary = false;
  var _employeeService = UserService();

  Future<void>_showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Text("Choose option",style: TextStyle(color: Colors.blue),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openGallery(context);
                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: Colors.blue,),
              ),

              Divider(height: 1,color: Colors.blue,),
              ListTile(
                onTap: (){
                  _openCamera(context);
                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: Colors.blue,),
              ),
            ],
          ),
        ),);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Add Employee"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // SizedBox(height: height*0.03,),
              // Center(
              //   child:  Text(
              //     'Add New Employee',
              //     style: TextStyle(
              //
              //         fontSize: 20,
              //         color: Colors.tealAccent,
              //         fontWeight: FontWeight.w500),
              //   ),
              // ),
              SizedBox(height: height*0.01,),
                Center(
                  child: GestureDetector(
                    onTap: (){
                      _showChoiceDialog(context);
                    },
                    child: CircleAvatar(

                        radius: 40,

                        backgroundColor: Color(0x67CD1FFF),
                        child: _imageFile != null
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child:( _imageFile==null)?Text("Choose Image"): Image.file( File(  _imageFile!.path))
                          ,
                        )
                            :Container(

                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50)
                          ),
                          width: 100,
                          height: 100,
                          child: Icon(Icons.camera_alt,color: Colors.grey[800],),
                        )
                    ),
                  ),
                ),

              SizedBox(height: height*0.04,),
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
                    labelText: 'Last Name',
                    errorText: _validatelastName
                        ? 'Last Name Value Can\'t Be Empty'
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
                        ? 'Email Value Can\'t Be Empty'
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
                        ? 'Designation Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                readOnly: true,
                controller: _dob,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "DOB",
                ),
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2025),
                  ).then((selectedDate) {
                    if (selectedDate != null) {
                      _dob.text = DateFormat('dd-MM-yyyy')
                          .format(selectedDate);
                    }
                  });
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                  controller: _salary,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Salary',
                    labelText: 'Salary',
                    errorText: _validateSalary
                        ? 'Salary Value Can\'t Be Empty'
                        : null,
                  )
              ),
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
                          _img.text.isEmpty
                              ? _validateImg = true
                              : _validateImg = false;

                        });
                        if (_validateName == false &&
                            _validatelastName == false &&
                            _validateEmail == false &&
                            _validateDesi == false &&
                            _validateDob == false &&
                            _validateSalary == false

                        ) {
                          // print("Good Data Can Save");
                          var _employee = Employee();
                          _employee.name = _name.text;
                          _employee.lastName = _lastName.text;
                          _employee.email = _email.text;
                          _employee.desi = _desi.text;
                          _employee.dob = _dob.text;
                          _employee.salary = _salary.text;
                          _employee.img = _imageFile!.path;
                          var result=await _employeeService.SaveEmployee(_employee);
                          Navigator.pop(context,result);
                        }
                      },
                      child: const Text('Add Employee')),
                  // const SizedBox(
                  //   height: 10.0,
                  //   width: 50.0,
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
                  //     child: const Text('Clear'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void _openGallery(BuildContext context) async{
    final image = await ImagePicker().getImage(
      source: ImageSource.gallery ,
    );
    setState(() {
      _imageFile = image!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context)  async{
    final image = await ImagePicker().getImage(
      source: ImageSource.camera ,
    );
    setState(() {
      _imageFile = image!;
    });
    Navigator.pop(context);
  }
}

