import 'package:fk_sql_crud/database_helper/database_helper.dart';
import 'package:fk_sql_crud/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmployeeBuilder extends StatelessWidget {
  const EmployeeBuilder({
    Key? key,
    required this.listEmployees,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);
  final Future<List<Employee>> listEmployees;
  final Function(Employee) onEdit;
  final Function(Employee) onDelete;

  Future<String> getDesignation(int id) async {
    final DatabaseHelper _databaseHelper = DatabaseHelper();
    final designation = await _databaseHelper.designation(id);
    return designation.designation;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Employee>>(
      future: listEmployees,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final employee = snapshot.data![index];
              return _buildemployeeCard(employee, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildemployeeCard(Employee employee, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              alignment: Alignment.center,
              child: FaIcon(FontAwesomeIcons.accusoft, size: 18.0),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employee.firstName,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // SizedBox(height: 4.0),
                  // FutureBuilder<String>(
                  //   future: getDesignation(employee.designationId),
                  //   builder: (context, snapshot) {
                  //     return Text('Breed: ${snapshot.data}');
                  //   },
                  // ),
                  // SizedBox(height: 4.0),
                  // Row(
                  //   children: [
                  //     Text('Age: ${employee.lastName.toString()}, Color: '),
                  //     // Container(
                  //     //   height: 15.0,
                  //     //   width: 15.0,
                  //     //   decoration: BoxDecoration(
                  //     //     borderRadius: BorderRadius.circular(4.0),
                  //     //     color: employee.,
                  //     //     border: Border.all(
                  //     //       color: Colors.black,
                  //     //       width: 1.5,
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                ],
              ),
            ),
            // SizedBox(width: 20.0),
            // GestureDetector(
            //   onTap: () => onEdit(employee),
            //   child: Container(
            //     height: 40.0,
            //     width: 40.0,
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: Colors.grey[200],
            //     ),
            //     alignment: Alignment.center,
            //     child: Icon(Icons.edit, color: Colors.orange[800]),
            //   ),
            // ),
            // SizedBox(width: 20.0),
            // GestureDetector(
            //   onTap: () => onDelete(employee),
            //   child: Container(
            //     height: 40.0,
            //     width: 40.0,
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: Colors.grey[200],
            //     ),
            //     alignment: Alignment.center,
            //     child: Icon(Icons.delete, color: Colors.red[800]),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}