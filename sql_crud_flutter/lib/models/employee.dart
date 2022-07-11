class Employee {
  int? id;
  String? name;
  String? lastName;
  String? email;
  String? desi;
  String? dob;
  String? salary;
  String? img;

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['name'] = name!;
    mapping['lastName'] = lastName!;
    mapping['email'] = email!;
    mapping['desi'] = desi!;
    mapping['dob'] = dob!;
    mapping['salary'] = salary!;
    mapping['img'] = img;

    return mapping;
  }

  @override
  String toString() {
    return 'Employee{id: $id, name: $name, lastName: $lastName, email: $email, desi: $desi, dob: $dob, salary: $salary, img: $img}';
  }
}
