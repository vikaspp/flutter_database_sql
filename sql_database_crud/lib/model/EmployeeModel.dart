class Employee{
  int? id;
  String? name;
  String? lastName;
  String? desi;
  double? salary;
  String? img;
  DateTime? dob;
  String? email;

  Employee({this.id , this.name, this.lastName ,
    this.desi , this.salary , this.img
    , this.dob , this.email});


  Employee.fromMap(Map<String, dynamic> map):
        id = map['id'],
        name = map['name'],
        lastName = map['lastName'],
        desi= map['desi'],
        salary = map['salary'],
        img = map['img'],
        dob = map['dob'],
        email = map['email'];

  Map<String ,Object?> toMap(){
    return {
      'id' : id,
      'name' : name,
      'lastName' : lastName,
      'desi' : desi,
      'salary' : salary,
      'img' : img,
      'dob' : dob,
      'email' : email,
    };
  }
}