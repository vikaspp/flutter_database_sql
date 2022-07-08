import 'package:database_crud/model/employee_model.dart';
import 'package:database_crud/util/database_helper.dart';
import 'package:flutter/material.dart';
class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  DBHelper? dbHelper;
  late Future<List<Employee>> employeeList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData ()async{
    employeeList =dbHelper!.getEmployeeList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee"),
      ),
      body: Column(
        children: [
          Expanded(
          child : FutureBuilder(
            future: employeeList,
            builder: (context,AsyncSnapshot<List<Employee>> snapshot){
             
              return ListView.builder(itemCount: snapshot.data?.length,itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text(snapshot.data![index].name.toString()),
                  ),
                );
              });
            }
          )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          dbHelper?.insert(
            Employee(name: 'abc', lastName: 'xyz', desi: 'hr', salary: 30000, img: 'link', dob: DateTime(03-02-2000), email: 'abc@gmail.com'
            )
          ).then((value){
            print("data added");


      }).onError((error, stackTrace){
            print(error.toString());
          });
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
