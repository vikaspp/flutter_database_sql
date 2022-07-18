import 'dart:convert';

class Designation {
  final int? id;
  final String designation;


  Designation({
    this.id,
    required this.designation,
  });

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'designation': designation,

    };
  }

  factory Designation.fromMap(Map<String, dynamic> map) {
    return Designation(
      id: map['id']?.toInt() ?? 0,
      designation: map['designation'] ?? '',
     );
  }

  String toJson() => json.encode(toMap());

  factory Designation.fromJson(String source) => Designation.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Designation{id: $id, designation: $designation}';
  }
}