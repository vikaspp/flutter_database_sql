import 'package:fk_sql_crud/database_helper/database_helper.dart';
import 'package:fk_sql_crud/designation_seleted.dart';
import 'package:fk_sql_crud/model/designation_model.dart';
import 'package:fk_sql_crud/model/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeFormPage extends StatefulWidget {
  const EmployeeFormPage({Key? key, this.employee}) : super(key: key);
  final Employee? employee;

  @override
  _EmployeeFormPageState createState() => _EmployeeFormPageState();
}

class _EmployeeFormPageState extends State<EmployeeFormPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();



  static final List<Designation> _designations = [];

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  int _selectedDesignation = 0;

  @override
  void initState() {
    super.initState();
    if (widget.employee != null) {
      _firstNameController.text = widget.employee!.firstName;
      _lastNameController.text = widget.employee!.lastName;
      _emailController.text = widget.employee!.email;
      _dobController.text = widget.employee!.dob;
      _salaryController.text = widget.employee!.dob;
      _imageController.text = widget.employee!.image;
     }
  }

  Future<List<Designation>> _getDesignations() async {
    final designations = await _databaseHelper.designations();
    if (_designations.length == 0) _designations.addAll(designations);
    if (widget.employee != null) {
      _selectedDesignation = _designations.indexWhere((e) => e.id == widget.employee!.designationId);
    }
    return _designations;
  }

  Future<void> _onSave() async {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final dob = _dobController.text;
    final salary = _salaryController.text;
    final image = _imageController.text;
    final designation = _designations[_selectedDesignation];

    // Add save code here
    widget.employee == null
        ? await _databaseHelper.insertEmployee(
      Employee(firstName:firstName,lastName:lastName,email:email,dob:dob,salary:salary,image:image, designationId: designation.id!),
    )
        : await _databaseHelper.updateEmployee(
      Employee(
        id: widget.employee!.id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        dob: dob,
        salary: salary,
        image: image,
        designationId: designation.id!,
       ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'First Name',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Last Name',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _dobController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'DOB',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _salaryController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Salary',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _imageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Image',
                ),
              ),

              SizedBox(height: 24.0),
              // Breed Selector
              // DropdownButtonHideUnderline(
              //     child: DropdownButton(
              //       value: _designations,
              //       items: [],
              //
              //     )
              // ),
              FutureBuilder<List<Designation>>(
                future: _getDesignations(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Designation");
                  }
                  return DesignationSelector(
                    designations : _designations.map((e) => e.designation).toList(),
                    selectedIndex: _selectedDesignation,
                    onChanged: (value) {
                      setState(() {
                       _selectedDesignation = value;
                      });
                    },
                  );
                },
              ),
              SizedBox(height: 24.0),
              SizedBox(
                height: 45.0,
                child: ElevatedButton(
                  onPressed: _onSave,
                  child: Text(
                    'Save Employee',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}