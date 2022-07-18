import 'package:fk_sql_crud/model/designation_model.dart';
import 'package:flutter/material.dart';

class DesignationBuilder extends StatelessWidget {
  const DesignationBuilder({
    Key? key,
    required this.future,
  }) : super(key: key);
  final Future<List<Designation>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Designation>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return DropdownMenuItem(
          // padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final designation = snapshot.data![index];
              return _buildDesignationCard(designation, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildDesignationCard(Designation designation, BuildContext context) {
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
                color: Colors.grey[300],
              ),
              alignment: Alignment.center,
              child: Text(
                designation.id.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    designation.designation,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}