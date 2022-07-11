import 'package:sql_crud_flutter/db_helper/repository.dart';
import 'package:sql_crud_flutter/models/employee.dart';
import 'package:sql_crud_flutter/view/EditEmployee.dart';

class UserService
{
  late Repository _repository;
  UserService(){
    _repository = Repository();
  }
  //Save User
  SaveEmployee(Employee employee) async{
    return await _repository.insertData('employee', employee.userMap());
  }
  //Read All Users
  readAllEmployee() async{
    return await _repository.readData('employee');
  }
  //Edit User
  EditEmployee(Employee employee) async{
    return await _repository.updateData('employee', employee.userMap());
  }

  deleteEmployee(userId) async {
    return await _repository.deleteDataById('employee', userId);
  }

}
