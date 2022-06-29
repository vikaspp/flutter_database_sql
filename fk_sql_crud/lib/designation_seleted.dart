import 'package:fk_sql_crud/model/designation_model.dart';
import 'package:flutter/material.dart';

class DesignationSelector extends StatefulWidget {
   DesignationSelector({
    Key? key,
    required this.designations,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);
  final List<String> designations;
  final int selectedIndex;
  final Function(int) onChanged;

  @override
  State<DesignationSelector> createState() => _DesignationSelectorState();
}

class _DesignationSelectorState extends State<DesignationSelector> {
  String dropdownValue = 'Select Value';
  // static final List<Designation> _designations = [];
  // int _selectedDesignation = 0;
  //
  // // int _selectedDesignation = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Designation',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        // SizedBox(height: 12.0),
        // Container(
        //   height: 40.0,
        //   child: ListView.builder(
        //     scrollDirection: Axis.vertical,
        //     itemCount: designations.length,
        //     itemBuilder: (context, index) {
        //       return GestureDetector(
        //         onTap: () => onChanged(index),
        //         child: Container(
        //           height: 40.0,
        //           padding: EdgeInsets.symmetric(horizontal: 12.0),
        //           margin: const EdgeInsets.only(right: 12.0),
        //           alignment: Alignment.center,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(8.0),
        //             border: Border.all(
        //               width: 3.0,
        //               color:
        //               selectedIndex == index ? Colors.teal : Colors.black,
        //             ),
        //           ),
        //           child: Text(designations[index]),
        //         ),
        //       );
        //     },
        //   ),
        // ),
         SizedBox(height: 12.0),
        Container(
          child: DropdownButton(
            hint: Text(dropdownValue),
            icon: Icon(Icons.keyboard_arrow_down),
            items: widget.designations.map(( designation){
              return DropdownMenuItem(
              value: designation,
              child: Text(designation),
              );
          }).toList(),
            onChanged: (String? value) {
              setState((){
                dropdownValue = value!;
              });
            },

          ),
        )
        // Container(
        //   padding: EdgeInsets.all(10.0),
        //   child: DropdownButtonHideUnderline(
        //     child: DropdownButton<Designation>(
        //         items:_locations.map((String val){
        //           return DropdownMenuItem<String>(
        //             value: val,
        //             child: Container(
        //                 margin: EdgeInsets.only(left: 10.0,right: 10.0),
        //                 child: new Text(val)
        //             ),
        //           );
        //         }).toList(),
        //       onChanged: (value) {
        //         setState(() {
        //           _selectedDesignation = value;
        //         });
        //       },
        //     ),
        //   ),
        // )
      ],
    );
  }
}