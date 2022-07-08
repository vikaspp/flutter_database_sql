import 'package:flutter/material.dart';
import 'package:sql_database_crud/view/EmployeeDetails.dart';
import 'package:sql_database_crud/view/EmployeeForm.dart';
import 'package:sql_database_crud/view/EmployeeUpdateForm.dart';
import 'package:sql_database_crud/view/HomePage.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> {
  final items = List<String>.generate(10, (i) => 'Employee ${i + 1}');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Employee"),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmployeeForm()),
            );
          }),
        ],
      ),
      body: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return EmployeeDetails();
          }));
        },
          child:ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(

            key: Key(item),

            onDismissed: (direction) {

              setState(() {
                items.removeAt(index);
              });


              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('$item dismissed')));
            },

            background: slideRightBackground(),
            secondaryBackground: slideLeftBackground(),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                final bool res = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text(
                            "Are you sure you want to delete ${items[index]}?"),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {

                              setState(() {
                                items.removeAt(index);
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
                return res;
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return EmployeeUpadteForm();
                }));
              }
            },
            child: ListTile(
              title: Text(item),
            ),
          );
        },
      ),
    ),
   );
  }
}

Widget slideRightBackground() {
  return Container(
    color: Colors.green,
    child: Align(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const  <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          Text(
            " Update",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    ),
  );


}

Widget slideLeftBackground() {
  return Container(
    color: Colors.red,
    child: Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text(
            " Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
  );
}