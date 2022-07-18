import 'package:fk_sql_crud/database_helper/database_helper.dart';
import 'package:fk_sql_crud/model/designation_model.dart';
import 'package:flutter/material.dart';

class DesignationFormPage extends StatefulWidget {
  const DesignationFormPage({Key? key}) : super(key: key);

  @override
  _DesignationFormPageState createState() => _DesignationFormPageState();
}

class _DesignationFormPageState extends State<DesignationFormPage> {
  final TextEditingController _designationController = TextEditingController();
   final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<void> _onSave() async {
    final designation = _designationController.text;

     await _databaseHelper.insertDesignation(Designation(designation: designation));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Designation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _designationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Designations',
              ),
            ),
            SizedBox(
              height: 45.0,
              child: ElevatedButton(
                onPressed: _onSave,
                child: Text(
                  'Save Designation',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}