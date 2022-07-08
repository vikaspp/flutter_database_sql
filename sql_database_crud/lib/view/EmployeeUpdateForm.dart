import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sql_database_crud/view/IndexPage.dart';

class EmployeeUpadteForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmployeeUpadteFormState();
  }
}

class _EmployeeUpadteFormState extends State<EmployeeUpadteForm> {


  TextEditingController birthdateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Employee"),
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
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name"
                  ),
                ),
                SizedBox(height: height*0.02,),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Last Name"
                  ),
                ),
                SizedBox(height: height*0.02,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email"
                  ),
                ),
                SizedBox(height: height*0.02,),
                TextFormField(
                  readOnly: true,
                  controller: birthdateController,
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
                        birthdateController.text = DateFormat('dd-MM-yyyy')
                            .format(selectedDate);
                      }
                    });
                  },
                ),
                SizedBox(height: height*0.02,),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Designation"
                  ),
                ),
                SizedBox(height: height*0.02,),
                TextFormField(
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
                    child: Text("  Update  "),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IndexPage()),
                      );
                      var snackBar = const SnackBar(content: Text('Updated Successfully ..!',style: TextStyle(color: Colors.green),));
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
