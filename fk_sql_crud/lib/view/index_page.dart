import 'package:fk_sql_crud/database_helper/database_helper.dart';
import 'package:fk_sql_crud/employee_builder.dart';
import 'package:fk_sql_crud/model/designation_model.dart';
import 'package:fk_sql_crud/model/employee_model.dart';
import 'package:fk_sql_crud/view/designation_form_page.dart';
import 'package:fk_sql_crud/view/employee_form_page.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<Employee>> _getEmployee() async {
    return await _databaseHelper.employees();
  }

  // Future<List<Designation>> _getDesignation() async {
  //   return await _databaseHelper.designations();
  // }

  Future<void> _onEmployeeDelete(Employee employee) async {
    await _databaseHelper.deleteEmployee(employee.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Employee'),
          centerTitle: true,
         actions: [
           IconButton(onPressed: (){
             Navigator.of(context)
                 .push(
               MaterialPageRoute(
                 builder: (_) => EmployeeFormPage(),
                 fullscreenDialog: true,
               ),
             )
                 .then((_) => setState(() {}));
           }, icon: Icon(Icons.add))
         ],
        ),
        body: EmployeeBuilder(
          listEmployees: _getEmployee(), onEdit: (Employee ) {  }, onDelete: (Employee ) {  },
          // children: [
          //   EmployeeBuilder(
          //
          //     onEdit: (value) {
          //       {
          //         Navigator.of(context)
          //             .push(
          //           MaterialPageRoute(
          //             builder: (_) => EmployeeFormPage(employee: value),
          //             fullscreenDialog: true,
          //           ),
          //         )
          //             .then((_) => setState(() {}));
          //       }
          //     },
          //     onDelete: _onEmployeeDelete,
          //   ),
          //   DesignationBuilder(
          //     future: _getDesignation(),
          //   ),
          // ],
        ),
        // floatingActionButton: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     FloatingActionButton(
        //       onPressed: () {
        //         Navigator.of(context)
        //             .push(
        //           MaterialPageRoute(
        //             builder: (_) => DesignationFormPage(),
        //             fullscreenDialog: true,
        //           ),
        //         )
        //             .then((_) => setState(() {}));
        //       },
        //       heroTag: 'addDesignation',
        //       child: FaIcon(FontAwesomeIcons.plus),
        //     ),
        //     SizedBox(height: 12.0),
        //     FloatingActionButton(
        //       onPressed: () {
        //         Navigator.of(context)
        //             .push(
        //           MaterialPageRoute(
        //             builder: (_) => EmployeeFormPage(),
        //             fullscreenDialog: true,
        //           ),
        //         )
        //             .then((_) => setState(() {}));
        //       },
        //       heroTag: 'addEmployee',
        //       child: Text("Add"),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}