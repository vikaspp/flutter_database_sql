import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sql_crud_flutter/models/employee.dart';
import 'package:sql_crud_flutter/services/UserService.dart';
import 'package:sql_crud_flutter/view/AddEmployee.dart';
import 'package:sql_crud_flutter/view/EditEmployee.dart';
import 'package:sql_crud_flutter/view/ViewEmployee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Employee> _userList = <Employee>[];
  final _userService = UserService();

  getAllUserDetails() async {
    var users = await _userService.readAllEmployee();
    _userList = <Employee>[];
    users.forEach((employee) {
      setState(() {
        var userModel = Employee();
        userModel.id = employee['id'];
        userModel.name = employee['name'];
        userModel.lastName = employee['lastName'];
        userModel.email = employee['email'];
        userModel.desi = employee['desi'];
        userModel.dob = employee['dob'];
        userModel.salary = employee['salary'];
        userModel.img = employee['img'];
        _userList.add(userModel);
      });
    });
  }

  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _deleteFormDialog(BuildContext context, userId) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Are You Sure to Delete',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, // foreground
                      backgroundColor: Colors.red),
                  onPressed: () async {
                    var result = await _userService.deleteEmployee(userId);
                    if (result != null) {
                      Navigator.pop(context);
                      getAllUserDetails();
                      _showSuccessSnackBar('Employee Detail Deleted Success');
                    }
                  },
                  child: const Text('Delete')),
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, // foreground
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee List"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddEmployee()))
                    .then((data) {
                  if (data != null) {
                    getAllUserDetails();
                    _showSuccessSnackBar('Employee Detail Added Success');
                  }
                });
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
          itemCount: _userList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewEmployee(
                                employee: _userList[index],
                              )));
                },
                leading: _userList[index].img != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(33.0),
                        child: Image.file(
                          File(_userList[index].img!),
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ))
                    : Icon(Icons.person),
                title: Text(_userList[index].name ?? ''),
                subtitle: Text(_userList[index].lastName ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditEmployee(
                                        employee: _userList[index],
                                      ))).then((data) {
                            if (data != null) {
                              getAllUserDetails();
                              _showSuccessSnackBar(
                                  'User Detail Updated Success');
                            }
                          });
                          ;
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        )),
                    IconButton(
                        onPressed: () {
                          _deleteFormDialog(context, _userList[index].id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            );
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
