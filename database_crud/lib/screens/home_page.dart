import 'package:database_crud/sql_helper.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // All journals
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }

  final TextEditingController _name = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _desi = TextEditingController();
  final TextEditingController _img = TextEditingController();
  final TextEditingController _salary = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _email = TextEditingController();




  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final employee =
      _journals.firstWhere((element) => element['id'] == id);
      _name.text = employee['name'];
      _lastName.text = employee['lastName'];
      _desi.text = employee['desi'];
        _img.text = employee['img'];
      _salary.text = employee['salary'];
        _dob.text = employee['dob'];
        _email.text = employee['email'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
          padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            // this will prevent the soft keyboard from covering the text fields
            bottom: MediaQuery.of(context).viewInsets.bottom + 120,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _name,
                decoration: const InputDecoration(hintText: 'name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _lastName,
                decoration: const InputDecoration(hintText: 'lastName'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _desi,
                decoration: const InputDecoration(hintText: 'desi'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _img,
                decoration: const InputDecoration(hintText: 'img'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _salary,
                decoration: const InputDecoration(hintText: 'salary'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _dob,
                decoration: const InputDecoration(hintText: 'dob'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _email,
                decoration: const InputDecoration(hintText: 'email'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Save new journal
                  if (id == null) {
                    await _addItem();
                  }
                  //
                  // if (id != null) {
                  //   await _updateItem(id);
                  // }

                  // Clear the text fields
                  _name.text = '';
                  _lastName.text = '';
                  _desi.text = '';
                  _img.text = '';
                  _salary.text = '';
                  _dob.text = '';
                  _email.text = '';


                  // Close the bottom sheet
                  Navigator.of(context).pop();
                },
                child: Text(id == null ? 'Create New' : 'Update'),
              )
            ],
          ),
        ));
  }


  Future<void> _addItem() async {
    await SQLHelper.createItem(
    _name.text, _lastName.text,_desi.text,_img.text,_salary.text,_dob.text,_email.text);
    _refreshJournals();
  }
//
//   // Update an existing journal
//   Future<void> _updateItem(int id) async {
//     await SQLHelper.updateItem(
//         id, _titleController.text, _descriptionController.text);
//     _refreshJournals();
//   }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a journal!'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hjdsk'),
      ),
      body: _isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: _journals.length,
        itemBuilder: (context, index) => Card(
          color: Colors.orange[200],
          margin: const EdgeInsets.all(15),
          child: ListTile(
              title: Text(_journals[index]['title']),
              subtitle: Text(_journals[index]['description']),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showForm(_journals[index]['id']),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          _deleteItem(_journals[index]['id']),
                    ),
                  ],
                ),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}