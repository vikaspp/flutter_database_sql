import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sql_database_crud/model/EmployeeModel.dart';
import 'package:sql_database_crud/view/IndexPage.dart';

class EmployeeForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmployeeFormState();
  }
}

class _EmployeeFormState extends State<EmployeeForm> {

  final List<Employee> employeeList = [];
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final desiController = TextEditingController();
  final salaryController = TextEditingController();
  final imgController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  bool _validateName = false;
  bool _validate = false;
  bool _validateDescription = false;


  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: height*0.02,),
                 CircleAvatar(
                  radius: 30.0,
                  backgroundImage:AssetImage(""),
                 backgroundColor: Colors.black26,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                ),

                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name"
                  ),
                ),
                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Last Name"
                  ),
                ),
                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email"
                  ),
                ),
                SizedBox(height: height*0.02,),
                TextFormField(
                  readOnly: true,
                  controller: dobController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "DOB"
                  ),
                  onTap: () async {
                    await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2025),
                    ).then((selectedDate) {
                      if (selectedDate != null) {
                        dobController.text = DateFormat('dd-MM-yyyy')
                            .format(selectedDate);
                      }
                    });
                  },
                ),
                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: desiController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Designation"
                  ),
                ),
                SizedBox(height: height*0.02,),
                TextFormField(
                  controller: salaryController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Salary"
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                  child: ElevatedButton(
                    child: Text("  Add  "),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IndexPage()),
                      );
                      var snackBar = const SnackBar(backgroundColor: Colors.green,content: Text('Added Successfully ..!',style: TextStyle(color: Colors.white),));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },

                  ),
                )

              ],

            ),
          ),
        ),
      ),
    );
  }
}
