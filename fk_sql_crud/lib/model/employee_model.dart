import 'dart:convert';

class Employee{
  final int? id;
  final String firstName;
  final String lastName;
  final String email;
  final String dob;
  final String salary;
  final String image;
  final int designationId;

  Employee({
      this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.dob,
      required this.salary,
      required this.image,
      required this.designationId
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName' : firstName,
      'lastName' : lastName,
      'email' : email,
      'dob' : dob,
      'salary' : salary,
      'image' : image,
      'designationId': designationId,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id']?.toInt() ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      dob: map['dob'] ?? '',
      salary: map['salary'] ?? '',
      image: map['image'] ?? '',
      designationId: map['designationId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) => Employee.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Employee{id: $id, firstName: $firstName, lastName: $lastName, email: $email, dob: $dob, salary: $salary, image: $image, designationId: $designationId}';
  }
}
